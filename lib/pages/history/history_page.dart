import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';
import 'package:mengo_delivery/pages/history/history_card.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../network/api_call_status.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(vsync: this, length: 3);
    // OrdersController ordersController=Get.find<OrdersController>();
    return GetBuilder<OrdersController>(builder: (ordersController) {
      return OverlayLoaderWithAppIcon(
        isLoading: ordersController.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/icons/logo.png')),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("History"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  30.verticalSpace,
                  Card(
                    elevation: 5.0,
                    shadowColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: TabBar(
                        controller: controller,
                        indicator: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        unselectedLabelColor: Colors.grey,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        tabs: const [
                          Tab(
                            text: "Pending",
                          ),
                          Tab(
                            text: "OnDelivery",
                          ),
                          Tab(
                            text: "Completed",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: controller,
                    children: [
                      // RecentView(),
                      // DownloadView(),
                      HistoryCard(orders: ordersController.pendingOrders),
                      HistoryCard(orders: ordersController.deliveringOrders),
                      HistoryCard(orders: ordersController.completedOrders),
                    ],
                  ))
                ],
              ),
            )),
      );
    });
  }
}
