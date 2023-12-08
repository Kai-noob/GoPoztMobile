import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mengo_delivery/pages/history/widgets/event_card.dart';
import 'package:mengo_delivery/utils/app_colors.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';

class OrderTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget child;
  final List<Map<String, String>> _deliveryStages = [
    {'status': 'Placed', 'icon': 'assets/icons/order_placed.png'},
    {'status': 'Assigned', 'icon': 'assets/icons/order_confirmed.png'},
    {'status': 'Picked', 'icon': 'assets/icons/order_confirmed.png'},
    {'status': 'Delivering', 'icon': 'assets/icons/order_processed.png'},
    {'status': 'Completed', 'icon': 'assets/icons/ready_to_pickup.png'},
  ];

  OrderTimeline(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 100.h,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        // lineXY: 3,
        beforeLineStyle: LineStyle(
            color: isPast ? primaryColor : primaryColor.withOpacity(0.1)),
        indicatorStyle: IndicatorStyle(
            width: 40,
            color: isPast ? primaryColor : primaryColor.withOpacity(0.1),
            iconStyle: IconStyle(
                color: isPast ? Colors.white : primaryColor.withOpacity(0.1),
                fontSize: 20,
                iconData: Icons.done)),
        endChild: EventCard(
          isPast: isPast,
          child: child,
        ),
      ),
    );
  }
}
