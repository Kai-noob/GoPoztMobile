import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/models/way_fee_model.dart';
import 'package:mengo_delivery/models/way_history_model.dart';
import 'package:mengo_delivery/network/api_call_status.dart';

import '../helpers/shared_pref_helper.dart';
import '../helpers/snackbar_helper.dart';
import '../models/available_way_model.dart';
import '../models/category_model.dart';
import '../models/city_model.dart';
import '../models/extrafee_model.dart';
import '../models/parcel_model.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class ReceiverController extends GetxController {
  final RxDouble _urgentFee = 0.0.obs;
  double get urgentFee => _urgentFee.value;

  final RxDouble _overWeightFee = 0.0.obs;
  double get overWeightFee => _overWeightFee.value;
  //?receiver
  final RxList<WayHistoryModel> _wayHistories = RxList.empty();
  List<WayHistoryModel> get wayHistories => _wayHistories.toList();
  final RxList<ParcelModel> _parcels = RxList.empty();
  List<ParcelModel> get parcels => _parcels.toList();
  final RxList<WayFeeModel> _totalFees = RxList.empty();
  List<WayFeeModel> get totalFees => _totalFees.toList();
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

  final RxString _deliveryTime = "".obs;
  String get deliveryTime => _deliveryTime.value;
  final RxString _parcelSize = "".obs;
  String get parcelSize => _parcelSize.value;
  final RxString _receiverCityName = "".obs;
  String get receiverCityName => _receiverCityName.value;
  final RxString _receiverTownshipName = "".obs;
  String get receiverTownshipName => _receiverTownshipName.value;

  final RxDouble _parcelWeight = 3.0.obs;
  double get parcelWeight => _parcelWeight.value;
  final RxBool _isPrepaid = false.obs;
  bool get isPrepaid => _isPrepaid.value;

  final RxDouble _fees = 0.0.obs;
  double get fees => _fees.value;
  final RxDouble _totalFee = 0.0.obs;
  double get totalFee => _totalFee.value;
  final BaseClient _baseClient = BaseClient();
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;
  List<CategoryModel> get categories => _categories.toList();

  final Rx<CategoryModel> _selectedCategory =
      CategoryModel(id: 1, name: "", isAvaliable: 0).obs;
  CategoryModel get selectedCategory => _selectedCategory.value;

  final RxList<AvaliableWay> _avaliableWays = <AvaliableWay>[].obs;
  List<AvaliableWay> get avaliableWays => _avaliableWays.toList();
  final RxList<City> _cities = <City>[].obs;
  List<City> get cities => _cities.toList();

  final RxList<File> _parcelPhotos=RxList.empty();
  List<File> get parcelPhotos => _parcelPhotos.toList();

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

  void selectReceiverCity(int id, String name) {
    _receiverCityId.value = id;
    _receiverCityName.value = name;
    print(id);
    print(name);
  }

  void selectReceiverTownship(int id, String name) {
    _receiverTownshipId.value = id;
    _receiverTownshipName.value = name;
    print(id);
    print(name);
  }

  void setDeliveryTime(String deliveryTime) {
    _deliveryTime.value = deliveryTime;
  }

  void setParcelSize(String parcelSize) {
    _parcelSize.value = parcelSize;
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

  void increseWeight() {
    _parcelWeight.value += 1;
  }

  void setParcelWeight(double value) {
    _parcelWeight.value = value;
  }

  void setIsPrepaid(bool isPrepaid) {
    _isPrepaid.value = isPrepaid;
  }

  double calculateTotalFee() {
    double calculatedFee = _totalFee.value;
    if (deliveryTime == 'urgent') {
      calculatedFee += urgentFee;
    }
    if (parcelWeight > 3) {
      calculatedFee += overWeightFee;
    }
    // calculatedFee=_totalFee.value;
    return calculatedFee;
    // if (parcelWeight > 3) {
    //   _totalFee.value += overWeightFee;
    // }

    // if (parcelWeight <= 3) {
    //   _totalFee.value -= overWeightFee;
    // }
    // _totalFee.value = _totalFee.value;
  }

  void removeWayHistoryAtIndex(int index) {
    if (index >= 0 && index < _wayHistories.length) {
      _wayHistories.removeAt(index);
      // Notify observers of the change
    }
     if (index >= 0 && index < _parcels.length) {
      _parcels.removeAt(index);
      // Notify observers of the change
    }
  }

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
        print("Extra Fee ${response.data}");
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

  Future<void> getReceiverTownships(
      int senderCityId, int receiverCityId) async {
    await _baseClient.safeApiCall(
      "${ApiUrls.waysUrl}/$senderCityId/to/$receiverCityId/available", // url
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
        Logger().d(response.data);
        _avaliableWays.value =
            (response.data['available_ways'] as List<dynamic>).map((item) {
          return AvaliableWay.fromJson(item);
        }).toList();

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

  clearReceiverInfo() {
    _parcels.clear();
  }

  Future<void> getDeliFees(
      int receiverCityId, int senderCityId, int receiverTownshipId) async {
    await _baseClient.safeApiCall(
      "${ApiUrls.waysUrl}/$senderCityId/to/$receiverCityId/and/$receiverTownshipId/available", // url
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
        Logger().d(response.data);
        // _avaliableWays.value =
        //     (response.data['available_ways'] as List<dynamic>).map((item) {
        //   return AvaliableWay.fromJson(item);
        // }).toList();
        _totalFee.value -= fees;
        _fees.value = double.parse(response.data['available_ways'][0]["fee"]);
        // _totalFee.value = 0;

        _totalFee.value += _fees.value;

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

  Future<void> selectImagesAndUpload() async {
    List<XFile>? selectedImages;
    final ImagePicker _picker = ImagePicker();
    try {
      selectedImages = await _picker.pickMultiImage(); // Select multiple images
    } catch (e) {
      print('Error selecting images: $e');
    }

    if (selectedImages != null && selectedImages.isNotEmpty) {
      List<File> imageFiles = selectedImages.map((image) => File(image.path)).toList();
      // await uploadMultipleImages(imageFiles);
      _parcelPhotos.value=imageFiles;
    }
  }

  void saveReceiverForm(
      BuildContext context, ParcelModel parcelModel, WayFeeModel wayFeeModel) {
    _parcels.add(parcelModel);
    // _totalFees.add(wayFeeModel);
    _wayHistories.add(
        WayHistoryModel(wayFeeModel: wayFeeModel, parcelModel: parcelModel));

    SnackBarHelper.showSuccessMessage(context: context, title: "Success");
    Get.back();
  }

  @override
  void onInit() {
    getCities();
    getCategories();
    getExtraFees();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    clearReceiverInfo();
    super.onClose();
  }
}
