import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/routes/app_pages.dart';

import '../helpers/shared_pref_helper.dart';

import '../helpers/snackbar_helper.dart';
import '../models/delivery_model.dart';
import '../models/parcel_model.dart';
import '../models/sender_model.dart';
import '../network/api_call_status.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class DeliveryController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

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
    // *) perform api call
    await _baseClient.safeApiCall(
      ApiUrls.ordersUrl, // url
      RequestType.post,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      // queryParameters: deliveryModel.toJson(),
      data: FormData.fromMap({
        'sender': senderModel.toJson(),
        'parcels': await Future.wait(
          parcelModel.map(
            (parcel) async {
              // List<MultipartFile> multipartFiles = [];
// List<File> files = convertStringListToFileList(parcel.parcelPhotos);

//         for (File file in files) {
//           if (file.existsSync()) {
//             MultipartFile multipartFile = await MultipartFile.fromFile(
//               file.path,
//               filename: file.path.split('/').last,
//             );
//             multipartFiles.add(multipartFile);
//           }
//         }
              // print("Photo ${parcel.parcelPhotos[0].toString()}");

              List<String> parcelPhotos = parcel.parcelPhotos;
              List<MultipartFile> multipartFiles = [];

              for (String photoPath in parcelPhotos) {
                File file = File(photoPath);
                if (file.existsSync()) {
                  MultipartFile multipartFile = await MultipartFile.fromFile(
                    photoPath,
                    filename: file.path.split('/').last,
                  );
                  print("Single ${multipartFile.filename}");
                  multipartFiles.add(multipartFile);
                }
              }
              print("MultitplePart File ${multipartFiles.length}");
              return {
                'pickup_time': parcel.pickupTime,
                'delivery_time': parcel.deliveryTime,
                'item_type': parcel.itemType,
                'prepaid': parcel.prepaid,
                'parcel_size': parcel.parcelSize,
                'parcel_weight': parcel.parcelWeight,
                'collect_cash_amount': parcel.collectCashAmount,
                // 'parcel_photos':multipartFiles.isNotEmpty ? multipartFiles : null,
                'parcel_photos': multipartFiles,

                'receiver': parcel.receiver.toJson()
              };
            },
          ).toList(),
        )
      }),
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
    DeliveryModel deliveryModel =
        DeliveryModel(sender: senderModel, parcels: parcelModel);
    Logger().f(deliveryModel.toJson());
    // *) perform api call
    await _baseClient.safeApiCall(
      ApiUrls.ordersUrl, // url
      RequestType.post,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      queryParameters: {
        'sender': deliveryModel.sender.toJson(),
        'parcels': deliveryModel.parcels.map((parcel) {
          print("Photo ${parcel.parcelPhotos[0].toString()}");
          return parcel.toJson();
        }).toList(),
        'partner_id': partnerId
      },
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

  List<File> convertStringListToFileList(List<String> stringList) {
    List<File> fileList = [];
    for (String path in stringList) {
      fileList.add(File(path));
    }
    return fileList;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
