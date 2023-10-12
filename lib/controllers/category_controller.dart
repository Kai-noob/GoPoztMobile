import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mengo_delivery/services/api_call_status.dart';

import '../helpers/shared_pref_helper.dart';
import '../services/base_client.dart';
import '../utils/api_url.dart';

class CategoryController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

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
        Logger().d(response.data);
        update();
      },

      onError: (error) {
        apiCallStatus = ApiCallStatus.error;
        BaseClient.handleApiError(error);
        update();
      },
    );
  }

  @override
  void onInit() {
    getCategories();  
    super.onInit();
  }
}
