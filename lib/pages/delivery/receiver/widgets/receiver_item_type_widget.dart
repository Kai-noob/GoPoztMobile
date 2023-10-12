import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../controllers/delivery_controller.dart';
import '../../../../models/category_model.dart';

class ReceiverItemTypeWidget extends StatelessWidget {
  const ReceiverItemTypeWidget({
    super.key,
    required this.controller,
  });

  final DeliveryController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: DropdownButtonFormField<CategoryModel>(
              iconSize: 32,
              iconEnabledColor: Colors.black,
              // value: controller.selectedCategory,
              items: controller.categories
                  .map((e) => DropdownMenuItem<CategoryModel>(
                      value: e,
                      child: Text(
                        e.name,
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      )))
                  .toList(),
              onChanged: (value) {
                controller.selectCategory(value!);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: black, fontSize: 13.sp, fontWeight: FontWeight.w500),
                hintText: "Item type",
              ),
            ),
          ),
        ));
  }
}
