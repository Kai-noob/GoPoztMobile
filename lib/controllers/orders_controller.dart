import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mengo_delivery/network/base_client.dart';

import '../helpers/shared_pref_helper.dart';
import '../models/order_model.dart';
import '../network/api_call_status.dart';
import '../utils/api_url.dart';

class OrdersController extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;
  final BaseClient _baseClient = BaseClient();

  final RxList<Order> _orders = RxList.empty();
  List<Order> get orders => _orders.toList();

  final RxList<Order> _pendingOrders = RxList.empty();
  List<Order> get pendingOrders => _pendingOrders.toList();
  final RxList<Order> _deliveringOrders = RxList.empty();
  List<Order> get deliveringOrders => _deliveringOrders.toList();

  final RxList<Order> _completedOrders = RxList.empty();
  List<Order> get completedOrders => _completedOrders.toList();

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

  Future<void> searchOrders(String key) async {
    await _baseClient.safeApiCall(
      ApiUrls.ordersUrl, // url
      RequestType.get,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${MySharedPref.getToken()}",
      },
      queryParameters: {"search": key},

      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        apiCallStatus = ApiCallStatus.success;

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

  Future<void> getPendingOrders() async {
    await _baseClient.safeApiCall(
      ApiUrls.pendingOrdersUrl, // url
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

        OrderResponse orderResponse = OrderResponse.fromJson(response.data);
        _pendingOrders.value = orderResponse.orders;
        print("Pending ${_pendingOrders.length}");

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

  Future<void> getDeliveringOrders() async {
    await _baseClient.safeApiCall(
      ApiUrls.deliveringOrdersUrl, // url
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
        print("Delivering ${response.data}");
        apiCallStatus = ApiCallStatus.success;

        OrderResponse orderResponse = OrderResponse.fromJson(response.data);
        _deliveringOrders.value = orderResponse.orders;

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

  Future<void> getCompletedOrders() async {
    await _baseClient.safeApiCall(
      ApiUrls.completedOrdersUrl, // url
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

        CompletedOrderResponse orderResponse =
            CompletedOrderResponse.fromJson(response.data);
        _completedOrders.value = orderResponse.orders;

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

  @override
  void onInit() {
    // getOrders();
    getPendingOrders();
    getDeliveringOrders();
    getCompletedOrders();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }
}
