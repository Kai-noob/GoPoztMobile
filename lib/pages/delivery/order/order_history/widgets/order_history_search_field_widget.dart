import 'package:flutter/material.dart';


import 'package:nb_utils/nb_utils.dart';

class OrderHistorySearchFieldWidget extends StatelessWidget {
  const OrderHistorySearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
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
