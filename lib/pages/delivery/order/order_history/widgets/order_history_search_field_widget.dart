import 'package:flutter/material.dart';
import 'package:mengo_delivery/controllers/orders_controller.dart';

import 'package:nb_utils/nb_utils.dart';

class OrderHistorySearchFieldWidget extends StatelessWidget {
  final OrdersController controller;
  const OrderHistorySearchFieldWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        onChanged: (value) {
          if(value.isEmpty){
            controller.getOrders();
          }else{
            controller.searchOrders(value);
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              LineIcons.times,
              color: Colors.grey,
            )),
      ),
    );
  }
}
