import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';
import 'package:mengo_delivery/routes/app_pages.dart';

import '../helpers/shared_pref_helper.dart';

import '../helpers/snackbar_helper.dart';
import '../models/delivery_model.dart';
import '../models/parcel_model.dart';
import '../models/sender_model.dart';
import '../network/api_call_status.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';
import 'receiver_controller.dart';
import 'sender_controller.dart';

class DeliveryController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  OrdersController ordersController = Get.find<OrdersController>();

  //   final RxList<AvaliableWay> _avaliableWays = <AvaliableWay>[].obs;
  // List<AvaliableWay> get avaliableWays => _avaliableWays.toList();

  final BaseClient _baseClient = BaseClient();

  // Future<SenderModel?> getSenderForm() async {
  //   SenderModel? senderModel = MySharedPref.getSenderForm();
  //   return senderModel;
  // }

  createOrder(BuildContext context, SenderModel senderModel,
      List<ParcelModel> parcelModel) async {
    Logger().f(parcelModel.length);
    if (senderModel.name.isEmpty ||
        senderModel.street.isEmpty ||
        senderModel.description.isEmpty ||
        senderModel.cityId == 0 ||
        senderModel.townshipId == 0 ||
        senderModel.phone.isEmpty) {
      SnackBarHelper.showErrorMessage(
        context: context,
        title: "Please fill sender info",
      );
      return;
    }
    if (parcelModel.isEmpty) {
      SnackBarHelper.showErrorMessage(
        context: context,
        title: "Please fill recipient info",
      );

      return;
    }
    // DeliveryModel deliveryModel =
    //     DeliveryModel(sender: senderModel, parcels: parcelModel);
    // Logger().f(deliveryModel.toJson());
    // *) perform api call\
    FormData formData = FormData();
// FormData _formData = FormData();

// Add sender data to FormData
    senderModel.toJson().forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    List<Map<String, dynamic>> parcelDataList = [];

// Process parcels and corresponding files
    for (var parcel in parcelModel) {
      List<String> parcelPhotos = parcel.parcelPhotos;
      List<MultipartFile> multipartFiles = [];

      for (String photoPath in parcelPhotos) {
        File file = File(photoPath);
        if (file.existsSync()) {
          MultipartFile multipartFile = await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
            contentType: MediaType('image', 'jpg'),
          );
          multipartFiles.add(multipartFile);
        }
      }

      Map<String, dynamic> parcelData = {
        'pickup_time': parcel.pickupTime,
        'delivery_time': parcel.deliveryTime,
        'item_type': parcel.itemType,
        'prepaid': parcel.prepaid,
        'parcel_size': parcel.parcelSize,
        'parcel_weight': parcel.parcelWeight,
        'collect_cash_amount': parcel.collectCashAmount,
        'receiver': parcel.receiver.toJson(),
      };

      parcelDataList.add(parcelData);

      for (int i = 0; i < multipartFiles.length; i++) {
        formData.files.add(MapEntry(
          'parcel_${parcelDataList.length}_photos[$i]',
          multipartFiles[i],
        ));
      }
    }

    FormData parcelsFormData = FormData.fromMap({
      'parcels': parcelDataList,
      'sender': senderModel.toJson(),
    });
    Logger().e("data ${parcelsFormData.files} ${parcelsFormData.fields}");
    FormData mergedFormData = formData..fields.addAll(parcelsFormData.fields);
    Logger().e("merge data ${mergedFormData.files} ${mergedFormData.fields}");

    await _baseClient.safeApiCall(
      ApiUrls.ordersUrl, // url
      RequestType.post,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      // queryParameters: deliveryModel.toJson(),
      data: mergedFormData,

      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully

        Logger().d(response.data);

        Get.offAllNamed(Routes.dashboard);
        SnackBarHelper.showSuccessMessage(
            context: context, title: response.data["message"]);
        ordersController.getPendingOrders();
        Get.delete<SenderController>(force: true);
        Get.delete<ReceiverController>(force: true);
        Get.delete<DeliveryController>(force: true);

        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(apiException: error, context: context);

        Logger().e(error.message);

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  createPartnerOrder(BuildContext context, SenderModel senderModel,
      List<ParcelModel> parcelModel, int? partnerId) async {
    Logger().f(parcelModel.length);
    if (senderModel.name.isEmpty ||
        senderModel.street.isEmpty ||
        senderModel.description.isEmpty ||
        senderModel.cityId == 0 ||
        senderModel.townshipId == 0 ||
        senderModel.phone.isEmpty) {
      SnackBarHelper.showErrorMessage(
        context: context,
        title: "Please fill sender info",
      );
      return;
    }
    if (parcelModel.isEmpty) {
      SnackBarHelper.showErrorMessage(
        context: context,
        title: "Please fill recipient info",
      );

      return;
    }
    // DeliveryModel deliveryModel =
    //     DeliveryModel(sender: senderModel, parcels: parcelModel);
    // Logger().f(deliveryModel.toJson());
    // *) perform api call\
    FormData formData = FormData();
// FormData _formData = FormData();

// Add sender data to FormData
    senderModel.toJson().forEach((key, value) {
      formData.fields.add(MapEntry(key, value.toString()));
    });

    List<Map<String, dynamic>> parcelDataList = [];

// Process parcels and corresponding files
    for (var parcel in parcelModel) {
      List<String> parcelPhotos = parcel.parcelPhotos;
      List<MultipartFile> multipartFiles = [];

      for (String photoPath in parcelPhotos) {
        File file = File(photoPath);
        if (file.existsSync()) {
          MultipartFile multipartFile = await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
            contentType: MediaType('image', 'jpg'),
          );
          multipartFiles.add(multipartFile);
        }
      }

      Map<String, dynamic> parcelData = {
        'pickup_time': parcel.pickupTime,
        'delivery_time': parcel.deliveryTime,
        'item_type': parcel.itemType,
        'prepaid': parcel.prepaid,
        'parcel_size': parcel.parcelSize,
        'parcel_weight': parcel.parcelWeight,
        'collect_cash_amount': parcel.collectCashAmount,
        'receiver': parcel.receiver.toJson(),
      };

      parcelDataList.add(parcelData);

      for (int i = 0; i < multipartFiles.length; i++) {
        formData.files.add(MapEntry(
          'parcel_${parcelDataList.length}_photos[$i]',
          multipartFiles[i],
        ));
      }
    }

    FormData parcelsFormData = FormData.fromMap({
      'parcels': parcelDataList,
      'sender': senderModel.toJson(),
      'partner_id': partnerId
    });
    Logger().e("data ${parcelsFormData.files} ${parcelsFormData.fields}");
    FormData mergedFormData = formData..fields.addAll(parcelsFormData.fields);
    Logger().e("merge data ${mergedFormData.files} ${mergedFormData.fields}");

    await _baseClient.safeApiCall(
      ApiUrls.ordersUrl, // url
      RequestType.post,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      // queryParameters: deliveryModel.toJson(),
      data: mergedFormData,

      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        // api done successfully

        Logger().d(response.data);

        Get.offAllNamed(Routes.dashboard);
        SnackBarHelper.showSuccessMessage(
            context: context, title: response.data["message"]);
        Get.delete<SenderController>(force: true);
        Get.delete<ReceiverController>(force: true);
        Get.delete<DeliveryController>(force: true);
        ordersController.getPendingOrders();

        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(apiException: error, context: context);

        Logger().e(error.message);

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }
}
