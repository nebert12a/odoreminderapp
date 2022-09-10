import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.h),
      child: Padding(
        padding: EdgeInsets.all(50.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(radius: 70.r,
              child: Icon(
                FontAwesomeIcons.bucket,
                size: 60.sp,
              ),
            ),
            SizedBox(
              width: 35.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "num",
                  style: TextStyle(
                      fontSize: 50.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "Description",
                  style: TextStyle(fontSize: 30.0.sp, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(
              width: 510.w,
            ),
            Icon(
              FontAwesomeIcons.arrowRight,
              size: 40.sp,
            ),
          ],
        ),
      ),
    );
  }
}
