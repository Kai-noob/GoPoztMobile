import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import 'package:logger/logger.dart';
import 'package:mengo_delivery/helpers/snackbar_helper.dart';

import 'package:mengo_delivery/models/category_model.dart';
import 'package:mengo_delivery/models/city_model.dart';

import 'package:mengo_delivery/models/parcel_model.dart';
import 'package:mengo_delivery/models/receiver_model.dart';
import 'package:mengo_delivery/models/sender_model.dart';
import 'package:mengo_delivery/models/township_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../helpers/shared_pref_helper.dart';
import '../routes/app_pages.dart';
import '../services/api_call_status.dart';
import '../services/base_client.dart';
import '../utils/api_url.dart';

class DeliveryController extends GetxController {
  final Rx<int> _weight = 3.obs;
  int get weight => _weight.value;
  final RxBool _isPrepaid = false.obs;
  bool get isPrepaid => _isPrepaid.value;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  List<CategoryModel> get categories => _categories.toList();
  final Rx<CategoryModel> _selectedCategory =
      CategoryModel(id: 1, name: "").obs;
  CategoryModel get selectedCategory => _selectedCategory.value;
  final RxList<City> _cities = <City>[].obs;
  List<City> get cities => _cities.toList();
  final RxList<Township> _townships = <Township>[].obs;
  List<Township> get townships => _townships.toList();

  //?sender
  final RxList<SenderModel> _senders = RxList.empty();
  List<SenderModel> get senders => _senders.toList();

  final RxInt _senderCityId = 0.obs;
  int get senderCityId => _senderCityId.value;
  final RxInt _senderTownshipId = 0.obs;
  int get senderTownshipId => _senderTownshipId.value;
  final RxString _senderCityName = "".obs;
  String get senderCityName => _senderCityName.value;
  final RxString _senderTownshipName = "".obs;
  String get senderTownshipName => _senderTownshipName.value;
  final RxString _senderName = "".obs;
  String get senderName => _senderName.value;
  final RxString _senderNumber = "".obs;
  String get senderNumber => _senderNumber.value;
  final RxString _senderAddress = "".obs;
  String get senderAddress => _senderAddress.value;
  final RxString _senderNote = "".obs;
  String get senderNote => _senderNote.value;

  //?receiver
  final RxList<ReceiverModel> _receivers = RxList.empty();
  List<ReceiverModel> get receivers => _receivers.toList();
  final RxString _receiverName = "".obs;
  String get receiverName => _receiverName.value;
  final RxString _receiverNumber = "".obs;
  String get receiverNumber => _receiverNumber.value;
  final RxString _receiverAddress = "".obs;
  String get receiverAddress => _receiverAddress.value;
  final RxString _receiverNote = "".obs;
  String get receiverNote => _receiverNote.value;
  final RxString _receiverCashAmount = "".obs;
  String get receiverCashAmount => _receiverCashAmount.value;
  final RxInt _receiverCityId = 0.obs;
  int get receiverCityId => _receiverCityId.value;
  final RxInt _receiverTownshipId = 0.obs;
  int get receiverTownshipId => _receiverTownshipId.value;
  final RxString _pickUpTime = "".obs;
  String get pickUpTime => _pickUpTime.value;
  final RxString _deliveryTime = "".obs;
  String get deliveryTime => _deliveryTime.value;
  final RxString _parcelSize = "".obs;
  String get parcelSize => _parcelSize.value;
  final RxString _receiverCityName = "".obs;
  String get receiverCityName => _receiverCityName.value;
  final RxString _receiverTownshipName = "".obs;
  String get receiverTownshipName => _receiverTownshipName.value;

  // final Rxn<SenderModel> _senderFromCache = Rxn<SenderModel>();
  // SenderModel? get senderFromCache => _senderFromCache.value;
  // final Rxn<ReceiverModel> _receiverFromCache = Rxn<ReceiverModel>();
  // ReceiverModel? get receiverFromCache => _receiverFromCache.value;
  // final Rxn<ParcelModel> _parcelFromCache = Rxn<ParcelModel>();
  // ParcelModel? get parcelFromCache => _parcelFromCache.value;
  // final RxString _pickUpTimeFromCache = "".obs;
  // String get pickUpTimeFromCache => _pickUpTimeFromCache.value;

  @override
  void onInit() {
    getCategories();
    getCities();
    getSenderForm();
    super.onInit();
  }

  getCategories() async {
    await BaseClient.safeApiCall(
      ApiUrls.categoriesUrl, // url
      RequestType.get,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },

      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        apiCallStatus = ApiCallStatus.success;
        Logger().d(response.data["categories"]);
        _categories.value =
            (response.data['categories'] as List<dynamic>).map((item) {
          Logger().e(item);
          return CategoryModel.fromJson(item);
        }).toList();

        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(error);
        update();
      },
    );
  }

  getCities() async {
    await BaseClient.safeApiCall(
      ApiUrls.citiesUrl, // url
      RequestType.get,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },

      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        apiCallStatus = ApiCallStatus.success;
        // Logger().d(response.data["regions"]);
        _cities.value = (response.data['cities'] as List<dynamic>).map((item) {
          return City.fromJson(item);
        }).toList();

        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(error);
        update();
      },
    );
  }

  getTownships(int cityId) async {
    await BaseClient.safeApiCall(
      "${ApiUrls.citiesUrl}/$cityId/townships", // url
      RequestType.get,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },

      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        apiCallStatus = ApiCallStatus.success;
        // Logger().d(response.data["regions"]);
        _townships.value =
            (response.data['townships'] as List<dynamic>).map((item) {
          return Township.fromJson(item);
        }).toList();

        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(error);
        update();
      },
    );
  }

  void increseWeight() {
    _weight.value += 1;
  }

  void decreaseWeight() {
    if (_weight.value == 3) {
      _weight.value = 3;
    } else {
      _weight.value -= 1;
    }
  }

  void changePrepaid(bool isPrepaid) {
    _isPrepaid.value = !isPrepaid;
  }

  void selectCategory(CategoryModel category) {
    _selectedCategory.value = category;
  }

  void selectSenderCity(int id, String name) {
    _senderCityId.value = id;
    _senderCityName.value = name;
  }

  void selectReceiverCity(int id, String name) {
    _receiverCityId.value = id;
    _receiverCityName.value = name;
    print(id);
    print(name);
  }

  void selectSenderTownship(int id, String name) {
    _senderTownshipId.value = id;
    _senderTownshipName.value = name;
  }

  void selectReceiverTownship(int id, String name) {
    _receiverTownshipId.value = id;
    _receiverTownshipName.value = name;
    print(id);
    print(name);
  }

  void setPickUpTime(String pickUpTime) {
    _pickUpTime.value = pickUpTime;
  }

  void setDeliveryTime(String deliveryTime) {
    _deliveryTime.value = deliveryTime;
  }

  void setParcelSize(String parcelSize) {
    _parcelSize.value = parcelSize;
  }

  void setSenderName(String value) {
    _senderName.value = value;
  }

  void setSenderNumber(String value) {
    _senderNumber.value = value;
  }

  void setSenderAddress(String value) {
    _senderAddress.value = value;
  }

  void setSenderNote(String value) {
    _senderNote.value = value;
  }

  void setReceiverName(String value) {
    _receiverName.value = value;
  }

  void setReceiverNumber(String value) {
    _receiverNumber.value = value;
  }

  void setReceiverAddress(String value) {
    _receiverAddress.value = value;
  }

  void setReceiverNote(String value) {
    _receiverNote.value = value;
  }

  void setReceiverCashAmount(String value) {
    _receiverCashAmount.value = value;
  }

  void saveSenderForm(SenderModel sender, String pickUpTime) {
    // MySharedPref.setSenderForm(sender);
    // Logger().d("Sender $sender");
    // MySharedPref.setPickUpTime(pickUpTime);
    // Logger().d("Sender $pickUpTime");
    _senders.add(sender);
    _pickUpTime.value = pickUpTime;

    Fluttertoast.showToast(msg: "Success");
    Get.back();
  }

  Future<SenderModel?> getSenderForm() async {
    SenderModel? senderModel = MySharedPref.getSenderForm();
    return senderModel;
  }

  Future<ReceiverModel?> getReceiverForm() async {
    ReceiverModel? receiverModel = MySharedPref.getReceiverForm();
    return receiverModel;
  }

  Future<ParcelModel?> getParcelDetails() async {
    ParcelModel? parcelModel = MySharedPref.getParcelDetails();
    return parcelModel;
  }

  Future<String?> getPickUpTime() async {
    String? pickupTime = MySharedPref.getPickUpTime();
    return pickupTime;
  }

  void saveReceiverForm(ReceiverModel receiverModel) {
    // MySharedPref.setReceiverForm(receiverModel);

    // ReceiverModel? receiver = MySharedPref.getReceiverForm();
    // Logger().d("Receiver ${receiver!.toJson()}");
    // MySharedPref.setParcelDetails(parcelModel);
    // ParcelModel? parcel = MySharedPref.getParcelDetails();
    _receivers.add(receiverModel);

    Fluttertoast.showToast(msg: "Success");
    Get.back();
  }

  void clearFromCache() {
    MySharedPref.clearForm();
  }

  createOrder(BuildContext context, List<SenderModel> senders,
      List<ReceiverModel> receivers) async {
    if (senders.isEmpty) {
      SnackBarHelper.showErrorMessage(
        context: context,
        title: "Please fill sender info",
      );
      return;
    }
    if (receivers.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill receiver info");
      return;
    }
    // *) perform api call
    await BaseClient.safeApiCall(
      ApiUrls.ordersUrl, // url
      RequestType.post,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      data: FormData.fromMap({
        'pickup_time': pickUpTime,
        'delivery_time': deliveryTime,
        'item_type': selectedCategory.name,
        'prepaid': isPrepaid == true ? 1 : 0,
        'parcel_size': parcelSize,
        'parcel_weight': weight,
        'collect_cash_amount': receiverCashAmount,
        // 'parcel_photos': ["Test.jpg", "Test.jpg"],
        'senders': jsonEncode(senders),
        'receivers': jsonEncode(receivers),
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

        clearFromCache();

        // *) indicate success state
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      // if you don't pass this method base client
      // will automaticly handle error and show message to user
      onError: (error) {
        // show error message to user
        BaseClient.handleApiError(error);

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

 
}
