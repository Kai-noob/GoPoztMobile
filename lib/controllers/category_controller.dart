// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
// import 'package:mengo_delivery/network/api_call_status.dart';

// import '../helpers/shared_pref_helper.dart';
// import '../network/base_client.dart';
// import '../utils/api_url.dart';

// class CategoryController extends GetxController {
//   ApiCallStatus apiCallStatus = ApiCallStatus.holding;
//   final BaseClient _baseClient = BaseClient();

//   getCategories() async {
//     await _baseClient.safeApiCall(
//       ApiUrls.categoriesUrl, // url
//       RequestType.get,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': "Bearer ${MySharedPref.getToken()}",
//       },

//       onLoading: () {
//         apiCallStatus = ApiCallStatus.loading;
//         update();
//       },
//          context: context,
//       onSuccess: (response) {
//         apiCallStatus = ApiCallStatus.success;
//         Logger().d(response.data);
//         update();
//       },

//       onError: (error) {
//         apiCallStatus = ApiCallStatus.error;
//         BaseClient.handleApiError(error);
//         update();
//       },
//     );
//   }

//   @override
//   void onInit() {
//     getCategories();  
//     super.onInit();
//   }
// }
