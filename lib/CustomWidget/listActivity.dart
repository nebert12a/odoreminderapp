import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../globalVariables/global.dart';

class ListActivity extends StatelessWidget {
  const ListActivity(
      {Key? key,
      required this.activity,
      required this.numberOfTimesRepeated,
      required this.icon,
      required this.color,
      required this.function})
      : super(key: key);
  final String activity;
  final int numberOfTimesRepeated;
  final IconData icon;
  final Color color;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Offset distance = Offset(10.sp, 10.sp);
    double blur = 30.r;
    return Padding(
      padding: EdgeInsets.only(top:30.h,left: 30.w,right: 30.w),
      child: Container(
        decoration: BoxDecoration(
          color: GlobalVariables.backgroundColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 30.h,
                offset: Offset(10.sp, 10.sp),
                color: const Color(0xFFA7A9AF)),
            BoxShadow(
              blurRadius: blur,
              offset: -distance,
              color: const Color(0xFFFFFFFF),
            ),
            BoxShadow(
              blurRadius: blur,
              offset: distance,
              color: const Color(0xFFA7A9AF),
            ),
          ],
        ),
        height: 300.h,
        child: Padding(
          padding: EdgeInsets.only(top: 40.0.h),
          child: ListTile(
            leading: CircleAvatar(
              radius: 100.r,
              backgroundColor: color,
              child: Icon(
                icon,
                size: 80.sp,
                color: GlobalVariables.backgroundColor,
              ),
            ),
            title: Text(
              numberOfTimesRepeated.toString(),
              style: TextStyle(
                  fontSize: 70.0.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            subtitle: Text(
              activity,
              style: TextStyle(fontSize: 45.0.sp, color: Colors.black54),
            ),
            trailing: Icon(
              FontAwesomeIcons.arrowRight,
              size: 40.sp,
            ),
            tileColor: Colors.white70,
            onTap: function,
            enabled: true,
          ),
        ),
      ),
    );
  }
}
