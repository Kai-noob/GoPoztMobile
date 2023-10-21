import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/models/announcement_model.dart';
import 'package:mengo_delivery/models/online_shop_model.dart';
import 'package:mengo_delivery/network/api_call_status.dart';

import '../helpers/shared_pref_helper.dart';
import '../network/base_client.dart';
import '../utils/api_url.dart';

class HomeController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  final RxList<Announcement> _announcements = RxList.empty();
  List<Announcement> get announcements => _announcements.toList();

  final RxList<OnlineShop> _onlineShops = RxList.empty();
  List<OnlineShop> get onlineShops => _onlineShops.toList();
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

  Future<void> getOnlineShops() async {
    await _baseClient.safeApiCall(
      ApiUrls.onlineshopsUrl, // url
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
        _onlineShops.value =
            (response.data['onlineShops'] as List<dynamic>).map((item) {
          return OnlineShop.fromJson(item);
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
    await Future.wait([getAnouncements(), getOnlineShops()]);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
