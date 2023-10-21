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
import 'package:mengo_delivery/models/create_order_model.dart';
import 'package:mengo_delivery/models/delivery_model.dart';
import 'package:mengo_delivery/models/extrafee_model.dart';
import 'package:mengo_delivery/models/order_model.dart';

import 'package:mengo_delivery/models/parcel_model.dart';
import 'package:mengo_delivery/models/receiver_model.dart';
import 'package:mengo_delivery/models/sender_model.dart';
import 'package:mengo_delivery/models/township_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../helpers/shared_pref_helper.dart';
import '../routes/app_pages.dart';
import '../network/api_call_status.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class DeliveryController extends GetxController {
  final RxDouble _parcelWeight = 3.0.obs;
  double get parcelWeight => _parcelWeight.value;
  final RxBool _isPrepaid = false.obs;
  bool get isPrepaid => _isPrepaid.value;

  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  List<CategoryModel> get categories => _categories.toList();
  final Rx<CategoryModel> _selectedCategory =
      CategoryModel(id: 1, name: "", isAvaliable: 0).obs;
  CategoryModel get selectedCategory => _selectedCategory.value;
  final RxList<City> _cities = <City>[].obs;
  List<City> get cities => _cities.toList();
  final RxList<Township> _townships = <Township>[].obs;
  List<Township> get townships => _townships.toList();

  final RxList<Order> _orders = RxList.empty();
  List<Order> get orders => _orders.toList();

  final RxDouble _urgentFee = 0.0.obs;
  double get urgentFee => _urgentFee.value;

  final RxDouble _overWeightFee = 0.0.obs;
  double get overWeightFee => _overWeightFee.value;

  //?sender
  final Rx<SenderModel> _sender = SenderModel(
          name: "",
          phone: "",
          cityId: 0,
          townshipId: 0,
          street: "",
          description: "")
      .obs;
  SenderModel get sender => _sender.value;

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
  final RxList<ParcelModel> _parcels = RxList.empty();
  List<ParcelModel> get parcels => _parcels.toList();
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
  final BaseClient _baseClient = BaseClient();

  Future<void> getExtraFees() async {
    await _baseClient.safeApiCall(
      ApiUrls.extraFeesUrl, // url
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
        ExtraFeeModel extraFeeModel =
            ExtraFeeModel.fromJson(response.data['setting']);
        _urgentFee.value = extraFeeModel.urgentFee;
        _overWeightFee.value = extraFeeModel.overWeightFee;
        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(apiException: error);
        update();
      },
    );
  }

  Future<void> getCategories() async {
    await _baseClient.safeApiCall(
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
        Logger().d("Categories ${response.data}");
        _categories.value =
            (response.data['categories'] as List<dynamic>).map((item) {
          Logger().e(item);
          return CategoryModel.fromJson(item);
        }).toList();

        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(apiException: error);
        update();
      },
    );
  }

  Future<void> getCities() async {
    await _baseClient.safeApiCall(
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
        _cities.value =
            (response.data['townships'] as List<dynamic>).map((item) {
          return City.fromJson(item);
        }).toList();

        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(apiException: error);
        update();
      },
    );
  }

  getTownships(int cityId) async {
    await _baseClient.safeApiCall(
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
        BaseClient.handleApiError(apiException: error);
        update();
      },
    );
  }

  Future<void> getReceiverCities() async {
    await _baseClient.safeApiCall(
      "${ApiUrls.waysUrl}/$senderCityId/available", // url
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
        // apiCallStatus = ApiCallStatus.success;
        Logger().d(response.data);
        // _townships.value =
        //     (response.data['townships'] as List<dynamic>).map((item) {
        //   return Township.fromJson(item);
        // }).toList();

        update();
      },

      onError: (error) {
        print(error.response);
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(apiException: error);
        update();
      },
    );
  }

  Future<void> getOrders() async {
    await _baseClient.safeApiCall(
      ApiUrls.ordersUrl, // url
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
        Logger().e("Response ${response.data}");
        OrderResponse orderResponse = OrderResponse.fromJson(response.data);
        _orders.value = orderResponse.orders;

        // Logger().d("Order ${_orders[0].parcels}");

        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(apiException: error);
        update();
      },
    );
  }

  void increseWeight() {
    _parcelWeight.value += 1;
  }

  void decreaseWeight() {
    if (_parcelWeight.value == 3) {
      _parcelWeight.value = 3;
    } else {
      _parcelWeight.value -= 1;
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

  void saveSenderForm(
      BuildContext context, SenderModel sender, String pickUpTime) {
    // MySharedPref.setSenderForm(sender);
    // Logger().d("Sender $sender");
    // MySharedPref.setPickUpTime(pickUpTime);
    // Logger().d("Sender $pickUpTime");
    Logger().i("Sender ${sender.toJson()}");
    _sender.value = sender;
    _pickUpTime.value = pickUpTime;

    // Fluttertoast.showToast(msg: "Success");
    SnackBarHelper.showSuccessMessage(context: context, title: "Success");
    Get.back();
  }

  // Future<SenderModel?> getSenderForm() async {
  //   SenderModel? senderModel = MySharedPref.getSenderForm();
  //   return senderModel;
  // }

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

  void saveReceiverForm(BuildContext context, ParcelModel parcelModel) {
    // MySharedPref.setReceiverForm(receiverModel);

    // ReceiverModel? receiver = MySharedPref.getReceiverForm();
    // Logger().d("Receiver ${receiver!.toJson()}");
    // MySharedPref.setParcelDetails(parcelModel);
    // ParcelModel? parcel = MySharedPref.getParcelDetails();

    _parcels.add(parcelModel);

    SnackBarHelper.showSuccessMessage(context: context, title: "Success");
    Get.back();
  }

  void clearFromCache() {
    MySharedPref.clearForm();
  }

  createOrder(BuildContext context, SenderModel senderModel,
      List<ParcelModel> parcelModel) async {
    Logger().f(
      senderModel.toJson(),
    );
    // Logger().f(parcelModel[0].toJson());
    if (sender.name.isEmpty ||
        sender.street.isEmpty ||
        sender.description.isEmpty ||
        sender.cityId == 0 ||
        sender.townshipId == 0 ||
        sender.phone.isEmpty ||
        pickUpTime.isEmpty) {
      SnackBarHelper.showErrorMessage(
        context: context,
        title: "Please fill sender info",
      );
      return;
    }
    if (parcels.isEmpty) {
      SnackBarHelper.showErrorMessage(
        context: context,
        title: "Please fill recipient info",
      );

      return;
    }
    DeliveryModel deliveryModel =
        DeliveryModel(sender: sender, parcels: parcels);
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
      queryParameters: deliveryModel.toJson(),
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
        BaseClient.handleApiError(apiException: error, context: context);

        Logger().e(error.message);

        // *) indicate error status
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  getData() async {
    await Future.wait([
      getCategories(),
      getExtraFees(),
      getCities(),
      getOrders(),
    ]);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void dispose() {

    super.dispose();
  }
}
