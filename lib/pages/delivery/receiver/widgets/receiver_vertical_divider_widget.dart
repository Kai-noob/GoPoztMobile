import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ReceiverVerticalDivider extends StatelessWidget {
  const ReceiverVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      color: black,
      width: 20,
      indent: 10,
      endIndent: 10,
    );
  }
}
