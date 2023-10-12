import 'package:flutter/material.dart';
import 'package:mengo_delivery/controllers/delivery_controller.dart';
import 'package:mengo_delivery/helpers/validator_helper.dart';
import 'package:nb_utils/nb_utils.dart';

class ReceiverNoteWidget extends StatelessWidget {
  final DeliveryController controller;
  const ReceiverNoteWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        initialValue: controller.receiverNote,
        validator: ValidatorHelper().noteValidator,
        onChanged: (value)=>controller.setReceiverNote(value),
        maxLines: 2,
        keyboardType: TextInputType.multiline,
        style:
            primaryTextStyle(color: grey, weight: FontWeight.normal, size: 12),
        decoration: InputDecoration(
            hintText: "Note",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
