// import '../network/base_client.dart';
// import '../utils/api_url.dart';

// class ApiService {
//   static Future<void> getAnnouncements(String token) async {
//     return BaseClient.safeApiCall(
//       ApiUrls.anounementsUrl,
//       RequestType.get,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': "Bearer $token",
//       }, onSuccess: (Response<dynamic> response) {  },
//     );
//   }

//   static Future<void> getOnlineShops(String token) async {
//     return BaseClient.safeApiCall(
//       ApiUrls.onlineshopsUrl,
//       RequestType.get,
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': "Bearer $token",
//       }, onSuccess: (Response<dynamic> response) {  },
//     );
//   }
// }