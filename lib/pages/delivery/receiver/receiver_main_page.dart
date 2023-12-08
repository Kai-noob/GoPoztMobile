import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mengo_delivery/components/custom_backbutton.dart';
import 'package:mengo_delivery/components/custom_divider.dart';
import 'package:mengo_delivery/components/custom_vertical_spacer.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/controllers/receiver_controller.dart';
import 'package:mengo_delivery/controllers/sender_controller.dart';
import 'package:mengo_delivery/models/category_model.dart';
import 'package:mengo_delivery/models/parcel_model.dart';

import 'package:mengo_delivery/models/receiver_model.dart';
import 'package:mengo_delivery/models/way_fee_model.dart';

import 'package:mengo_delivery/pages/delivery/receiver/widgets/receiver_phone_widget.dart';
import 'package:mengo_delivery/pages/delivery/receiver/widgets/receiver_way_count_widget.dart';

import 'package:mengo_delivery/utils/app_constants.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../../helpers/snackbar_helper.dart';
import '../../../network/api_call_status.dart';
import '../../../utils/app_colors.dart';
import 'widgets/receiver_address_widget.dart';
import 'widgets/receiver_cash_amount_widget.dart';
import 'widgets/receiver_city_area_widget.dart';
import 'widgets/receiver_confirm_widget.dart';
import 'widgets/receiver_delivery_time_widget.dart';
import 'widgets/receiver_estimate_widget.dart';
import 'widgets/receiver_image_widget.dart';
import 'widgets/receiver_item_type_widget.dart';
import 'widgets/receiver_name_widget.dart';
import 'widgets/receiver_note_widget.dart';
import 'widgets/receiver_onlineshop_widget.dart';
import 'widgets/receiver_parcel_size_widget.dart';
import 'widgets/receiver_prepaid_widget.dart';
import 'widgets/receiver_prohibited_widget.dart';
import 'widgets/receiver_vertical_divider_widget.dart';
import 'widgets/receiver_weight_widget.dart';

class ReceiverMainPage extends StatelessWidget {
  ReceiverMainPage({
    super.key,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SenderController senderController = Get.find<SenderController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReceiverController>(builder: (receiverController) {
      // controller.getReceiverCities();
      return OverlayLoaderWithAppIcon(
        isLoading: receiverController.apiCallStatus == ApiCallStatus.loading,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: primaryColor,
        appIcon: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/icons/logo.png')),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Recipient details"),
            leading: CustomBackButton(
              onTap: () {
                Get.back();
              },
            ),
          ),
          body: Form(
            key: formKey,
            child: ListView(padding: AppConstants.defaultPadding, children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      ReceiverWayCountWidget(
                        controller: receiverController,
                      ),
                      SizedBox(
                        height: 35.h,
                        child: Row(
                          children: [
                            ReceiverNameWidget(
                              controller: receiverController,
                            ),
                            const Expanded(
                              child: ReceiverVerticalDivider(),
                            ),
                            ReceiverPhoneWidget(
                              controller: receiverController,
                            ),
                          ],
                        ),
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      ReceiverCityAreaWidget(
                        receiverController: receiverController,
                        senderController: senderController,
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      ReceiverAddressWidget(
                        controller: receiverController,
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      ReceiverDeliveryTimeWidget(controller: receiverController)
                    ]),
              ),
              const CustomVerticalSpacer(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              "Percel details",
                              style: TextStyle(
                                color: black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                        child: Row(
                          children: [
                            ReceiverItemTypeWidget(
                                controller: receiverController),
                            const ReceiverVerticalDivider(),
                            ReceiverPrepaidWidget(
                                controller: receiverController),
                          ],
                        ),
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      SizedBox(
                        height: 35.h,
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: [
                                ReceiverParcelSizeWidget(
                                  controller: receiverController,
                                ),
                                const Expanded(
                                    child: ReceiverVerticalDivider()),
                                ReceiverWeightWidget(
                                    controller: receiverController),
                              ],
                            )),
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      ReceiverCashAmountWidget(
                        controller: receiverController,
                      ),
                      const CustomDivider(
                        color: Colors.black,
                        endIndent: 15,
                        indent: 15,
                      ),
                      // const ReceiverOnlineShopWidget(),
                      const CustomVerticalSpacer(height: 15),
                      ReceiverImageWidget(
                        controller: receiverController,
                      ),
                      const ReceiverProhibitedWidget(),
                      const CustomVerticalSpacer(height: 10),
                      ReceiverNoteWidget(
                        controller: receiverController,
                      ),
                      const CustomVerticalSpacer(height: 8),
                    ]),
              )
            ]),
          ),
          bottomNavigationBar: Container(
            height: 55.h,
                  color: const Color(0xFFF5F5F5),
            child: Row(children: [
              ReceiverEstimationWidget(
                controller: receiverController,
              ),
              ReceiverConfirmWidget(
                onTap: () {
                  if (!formKey.currentState!.validate()) {
                    Future.delayed(Duration.zero, () {
                      SnackBarHelper.showErrorMessage(
                        context: context,
                        title: "Please fix the errors above.",
                      );
                    });
                    return; // Exit early if form validation fails.
                  }

                  if (receiverController.receiverCityName.isEmpty ||
                      receiverController.receiverTownshipName.isEmpty) {
                    SnackBarHelper.showErrorMessage(
                      context: context,
                      title: "Please Select City And Township",
                    );
                    return;
                  }

                  if (receiverController.parcelSize.isEmpty) {
                    SnackBarHelper.showErrorMessage(
                      context: context,
                      title: "Please Select Parcel Size",
                    );
                    return; // Exit early if parcel size is not selected.
                  }
                  if (receiverController.selectedCategory.name.isEmpty) {
                    SnackBarHelper.showErrorMessage(
                      context: context,
                      title: "Please Select Item Type",
                    );
                    return; // Exit early if parcel size is not selected.
                  }

                  print("Parcel${receiverController.parcelPhotos.length}");

                  receiverController.saveReceiverForm(
                      context,
                      ParcelModel(
                          pickupTime: senderController.pickUpTime,
                          deliveryTime: receiverController.deliveryTime,
                          itemType: receiverController.selectedCategory.name,
                          prepaid: receiverController.isPrepaid == true ? 1 : 0,
                          parcelSize: receiverController.parcelSize,
                          parcelWeight: receiverController.parcelWeight,
                          parcelPhotos: receiverController.parcelPhotos
                              .map((e) => e.path)
                              .toList(),
                          collectCashAmount: double.parse(
                              receiverController.receiverCashAmount),
                          receiver: ReceiverModel(
                            name: receiverController.receiverName,
                            phone: receiverController.receiverNumber,
                            cityId: receiverController.receiverCityId,
                            townshipId: receiverController.receiverTownshipId,
                            street: receiverController.receiverAddress,
                            description: receiverController.receiverNote,
                          )),
                      WayFeeModel(
                          overWeightFee: receiverController.parcelWeight > 3
                              ? receiverController.overWeightFee
                              : 0.0,
                          urgentFee: receiverController.deliveryTime == 'urgent'
                              ? receiverController.urgentFee
                              : 0.0,
                          wayFee: receiverController.totalFee));
                  receiverController.setReceiverName("");
                  receiverController.setReceiverNumber("");
                  receiverController.selectReceiverCity(0, "");
                  receiverController.selectReceiverTownship(0, "");
                  receiverController.setReceiverAddress("");
                  receiverController.setDeliveryTime("");
                  receiverController.changePrepaid(false);
                  receiverController.setParcelSize("");
                  receiverController.setReceiverCashAmount("");
                  receiverController.setReceiverNote("");
                  receiverController.setParcelWeight(3.0);
                  receiverController.setIsPrepaid(false);
                  receiverController.setReceiverParcelPhotos();
                },
              )
            ]),
          ),
        ),
      );
    });
  }
}
