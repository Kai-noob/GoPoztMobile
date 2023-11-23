import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';

import '../helpers/shared_pref_helper.dart';
import '../helpers/snackbar_helper.dart';
import '../models/city_model.dart';
import '../models/sender_model.dart';
import '../models/township_model.dart';
import '../network/api_call_status.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class SenderController extends GetxController {
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

  final RxString _pickUpTime = "".obs;
  String get pickUpTime => _pickUpTime.value;
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  final BaseClient _baseClient = BaseClient();
  final RxList<Township> _townships = <Township>[].obs;
  List<Township> get townships => _townships.toList();
  final RxList<City> _cities = <City>[].obs;
  List<City> get cities => _cities.toList();

  void selectSenderCity(int id, String name) {
    _senderCityId.value = id;
    _senderCityName.value = name;
  }

  void selectSenderTownship(int id, String name) {
    _senderTownshipId.value = id;
    _senderTownshipName.value = name;
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

  void setPickUpTime(String pickUpTime) {
    _pickUpTime.value = pickUpTime;
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

  clearSenderInfo() {
    _sender.value = SenderModel(
        name: '',
        phone: '',
        cityId: 0,
        townshipId: 0,
        street: '',
        description: '');
    _pickUpTime.value = '';
  }

  getSenderTownships(int cityId) async {
    await _baseClient.safeApiCall(
      "${ApiUrls.citiesUrl}/$cityId", // url
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
            (response.data['available_townships'] as List<dynamic>).map((item) {
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

  @override
  void onInit() {
    getCities();
    super.onInit();
  }

  @override
  void onClose() {
    clearSenderInfo();
    super.onClose();
  }
}
