import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/models/ads_model.dart';
import 'package:mengo_delivery/models/announcement_model.dart';
import 'package:mengo_delivery/models/deliverer_model.dart';
import 'package:mengo_delivery/models/online_shop_model.dart';
import 'package:mengo_delivery/network/api_call_status.dart';

import '../helpers/shared_pref_helper.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class HomeController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  final RxList<Announcement> _announcements = RxList.empty();
  List<Announcement> get announcements => _announcements.toList();

  final RxList<DelivererModel>_deliverers = RxList.empty();
  List<DelivererModel> get deliverers => _deliverers.toList();

  final RxList<Advertisement> _advertisements = RxList.empty();
  List<Advertisement> get advertisements => _advertisements.toList();
  final BaseClient _baseClient = BaseClient();

  Future<void> getAnouncements() async {
    await _baseClient.safeApiCall(
      ApiUrls.anounementsUrl, // url
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
        _announcements.value =
            (response.data['announcements'] as List<dynamic>).map((item) {
          return Announcement.fromJson(item);
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

  Future<void> getPartners() async {
    await _baseClient.safeApiCall(
      ApiUrls.partnersUrl, // url
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
        Logger().d("Partners ${response.data}");
        _deliverers.value =
            (response.data['deliverer'] as List<dynamic>).map((item) {
          return DelivererModel.fromJson(item);
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

  Future<void> getAds() async {
    await _baseClient.safeApiCall(
      ApiUrls.advertisementsUrl, // url
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

        _advertisements.value =
            (response.data['advertisements'] as List<dynamic>).map((item) {
          return Advertisement.fromJson(item);
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

  Future<void> getData() async {
    await Future.wait([getAnouncements(), getPartners(), getAds()]);
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
