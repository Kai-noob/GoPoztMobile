import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

import 'package:logger/logger.dart';
import 'package:mengo_delivery/helpers/snackbar_helper.dart';
import 'package:mengo_delivery/utils/app_cache_part.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/string_enum.dart';
import 'api_exceptions.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

class BaseClient {
  final Dio _dio;

  BaseClient() : _dio = _createDioInstance();

  static Dio _createDioInstance() {
    final Dio dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _addLoggerInterceptor(dio);
    // _addCacheInterceptor(dio);

    return dio;
  }

  static void _addLoggerInterceptor(Dio dio) {
    final loggerInterceptor = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
    dio.interceptors.add(loggerInterceptor);
  }

  static void _addCacheInterceptor(Dio dio) {
    final cacheInterceptor = DioCacheInterceptor(
      options: CacheOptions(
        store:
            HiveCacheStore(AppCachePathProvider.path, hiveBoxName: "go_pozt"),
        policy: CachePolicy.refreshForceCache,
        hitCacheOnErrorExcept: [401, 404],
        maxStale: const Duration(minutes: 5),
        keyBuilder: (request) {
          return request.uri.toString();
        },
        allowPostMethod: false,
        priority: CachePriority.high,
      ),
    );
    dio.interceptors.add(cacheInterceptor);
  }

  // request timeout (default 10 seconds)
  static const int _timeoutInSeconds = 10;

  /// dio getter (used for testing)
  // static get dio => _dio;

  /// perform safe api request
  Future<void> safeApiCall(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    Function(int total, int progress)?
        onSendProgress, // while sending (uploading) progress
    Function? onLoading,
    dynamic data,
  }) async {
    try {
      // 1) indicate loading state
      await onLoading?.call();
      // 2) try to perform http request
      late Response response;
      if (requestType == RequestType.get) {
        response = await _dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        );
      } else if (requestType == RequestType.post) {
        response = await _dio.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.put) {
        response = await _dio.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else {
        response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      }
      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioException catch (error) {
      // dio error (api reach the server but not performed successfully
      _handleDioError(
        error: error,
        url: url,
        onError: onError,
      );
    } on SocketException {
      // No internet connection
      _handleSocketException(
        url: url,
        onError: onError,
      );
    } on TimeoutException {
      // Api call went out of time
      _handleTimeoutException(
        url: url,
        onError: onError,
      );
    } catch (error) {
      // print the line of code that throw unexpected exception
      Logger().e(error);
      // unexpected error for example (parsing json error)
      _handleUnexpectedException(
        url: url,
        onError: onError,
        error: error,
      );
    }
  }

  // /// download file
  // static download({
  //   required String url, // file url
  //   required String savePath, // where to save file
  //   Function(ApiException)? onError,
  //   Function(int value, int progress)? onReceiveProgress,
  //   required Function onSuccess,
  // }) async {
  //   try {
  //     await _dio.download(
  //       url,
  //       savePath,
  //       options: Options(
  //           receiveTimeout: const Duration(seconds: _timeoutInSeconds),
  //           sendTimeout: const Duration(seconds: _timeoutInSeconds)),
  //       onReceiveProgress: onReceiveProgress,
  //     );
  //     onSuccess();
  //   } catch (error) {
  //     var exception = ApiException(url: url, message: error.toString());
  //     onError?.call(exception) ??
  //         _handleError(
  //           error.toString(),
  //         );
  //   }
  // }

  /// handle unexpected error
  static _handleUnexpectedException({
    Function(ApiException)? onError,
    required String url,
    required Object error,
  }) {
    if (onError != null) {
      onError(ApiException(
        message: error.toString(),
        url: url,
      ));
    } else {
      _handleError(
        error.toString(),
      );
    }
  }

  /// handle timeout exception
  static _handleTimeoutException({
    Function(ApiException)? onError,
    required String url,
  }) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.serverNotResponding.tr,
        url: url,
      ));
    } else {
      _handleError(
        Strings.serverNotResponding.tr,
      );
    }
  }

  /// handle timeout exception
  static _handleSocketException({
    Function(ApiException)? onError,
    required String url,
  }) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.noInternetConnection.tr,
        url: url,
      ));
    } else {
      _handleError(
        Strings.noInternetConnection.tr,
      );
    }
  }

  /// handle Dio error
  static _handleDioError({
    required DioException error,
    Function(ApiException)? onError,
    required String url,
  }) {
    // 404 error
    if (error.response?.statusCode == 404) {
      if (onError != null) {
        return onError(ApiException(
          message: Strings.urlNotFound.tr,
          url: url,
          statusCode: 404,
        ));
      } else {
        return _handleError(
          Strings.urlNotFound.tr,
        );
      }
    }

    // no internet connection
    if (error.message != null &&
        error.message!.toLowerCase().contains('socket')) {
      if (onError != null) {
        return onError(ApiException(
          message: Strings.noInternetConnection.tr,
          url: url,
        ));
      } else {
        return _handleError(
          Strings.noInternetConnection.tr,
        );
      }
    }

    // check if the error is 500 (server problem)
    if (error.response?.statusCode == 500) {
      var exception = ApiException(
        message: Strings.serverError.tr,
        url: url,
        statusCode: 500,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(
          apiException: exception,
        );
      }
    }

    var exception = ApiException(
        url: url,
        message: error.message ?? 'Un Expected Api Error!',
        response: error.response,
        statusCode: error.response?.statusCode);
    if (onError != null) {
      return onError(
        exception,
      );
    } else {
      return handleApiError(
        apiException: exception,
      );
    }
  }

  /// handle error automaticly (if user didnt pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason (the dio message)
  static void handleApiError(
      {required ApiException apiException, BuildContext? context}) {
    // String msg = apiException.response!.data?["message"]?.toString() ??
    //     "An error occurred";

    String message = "";

    try {
      // Your API call or logic here

      if (apiException.response != null &&
          apiException.response!.data != null &&
          apiException.response!.data!.containsKey("errors")) {
        final errors = apiException.response!.data!["errors"];

        if (errors is Map) {
          final phoneErrors = errors["phone"] ?? [];
          final passwordErrors = errors["password"] ?? [];

          if (phoneErrors.isNotEmpty) {
            // Handle phone field errors
            message = phoneErrors.join(", ");
          }

          if (passwordErrors.isNotEmpty) {
            // Handle password field errors
            message = passwordErrors.join(", ");
          }
        } else {
          // Handle unexpected error structure
          message = "Something wrong";
        }
      } else {
        // Handle other types of errors
        message = apiException.response!.data["message"];
      }
    } catch (error) {
      Logger().i(error.toString());
      // Handle other types of errors, e.g., network errors or unexpected exceptions
      message = "";
    }

// Provide a default message if the response doesn't contain errors.
    if (message.isEmpty) {
      message = "Unknown error";
    }
    if (context != null) {
      // SnackBarHelper.showErrorMessage(context: context, title: message);
    } else {
      Fluttertoast.showToast(msg: message);
    }
  }

  static void handleAuthError(ApiException apiException) {
    String msg = apiException.response!.data?["message"]?.toString() ??
        "An error occurred"; // Provide a default message if response["message"] is not available.

    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT, // Specify toast length (short or long).
      gravity:
          ToastGravity.BOTTOM_RIGHT, // Specify toast gravity (e.g., CENTER).
      timeInSecForIosWeb: 2, // Specify duration on iOS and web platforms.
      backgroundColor: Colors.red, // Specify background color.
      textColor: Colors.white, // Specify text color.
      fontSize: 16.0, // Specify font size.
    );
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static _handleError(
    String msg,
  ) {
    Fluttertoast.showToast(msg: msg);
  }
}