import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoryClass extends StatelessWidget {
  const HistoryClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100.h,
          child: TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.13,
            isFirst: true,
            endChild:  Row(
              children: [
                SizedBox(width: 20.w,),
                Text("Purpose"),
              ],
            ),
            indicatorStyle: IndicatorStyle(
              width: 30.w,
              color: Colors.purple,
            ),
            beforeLineStyle: LineStyle(
              color: Colors.purple,
              thickness: 6.w,
            ),
          ),
        ),
        SizedBox(
          height: 100.h,
          child: TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.13,
            isLast: true,
            endChild:Row(
              children: [
                SizedBox(width: 20.w,),
                Text("Author"),
                Text("|"),
                Text(DateTime.now().toString()),
              ],
            ),
            indicatorStyle: IndicatorStyle(
              width: 30.w,
              color: Colors.blueAccent,
            ),
            beforeLineStyle: LineStyle(
              color: Colors.blueAccent,
              thickness: 6.w,
            ),
          ),
        ),
      ],
    );
  }
}
