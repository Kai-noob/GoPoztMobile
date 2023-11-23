import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? endIndent;
  final double? indent;
  const CustomDivider(
      {super.key, this.color, this.thickness, this.endIndent, this.indent});

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: Colors.grey, thickness: 0.4, endIndent: 10, indent: indent);
  }
}
