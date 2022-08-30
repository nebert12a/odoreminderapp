import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../globalVariables/global.dart';

class ListActivity extends StatelessWidget {
  const ListActivity({Key? key, required this.activity, required this.numberOfTimesRepeated, required this.icon, required this.color, required this.function}) : super(key: key);
  final String activity;
  final int numberOfTimesRepeated;
  final IconData icon;
  final Color color;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.all(30.h),
    child: Container(
      decoration:  BoxDecoration(
        color: GlobalVariables.backgroundColor,
        boxShadow:[
         BoxShadow(
           blurRadius:30.h,
          offset: Offset(10.sp,10.sp),
           color: const Color(0xFFA7A9AF)
         )
        ],

      ),

      child: ListTile(
        leading:CircleAvatar(radius: 70.r,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 60.sp,
            color: GlobalVariables.backgroundColor,
          ),
        ),
        title:   Text(
            numberOfTimesRepeated.toString(),
          style: TextStyle(
              fontSize: 50.0.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black54),
        ),
        subtitle:  Text(
          activity,
          style: TextStyle(fontSize: 30.0.sp, color: Colors.black54),
        ),
        trailing:  Icon(
          FontAwesomeIcons.arrowRight,
          size: 40.sp,
        ),
        tileColor: Colors.white70,
        onTap: function,
        enabled: true,
      ),
    ),);
  }
}
