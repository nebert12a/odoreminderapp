import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../CustomWidget/listActivity.dart';
import '../../globalVariables/global.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Offset distance = Offset(10.sp, 10.sp);
  double blur = 30.r;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "My activities",
                  style: TextStyle(
                      fontSize: 50.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  width: 580.w,
                ),
                GestureDetector(
                  child: Icon(
                    FontAwesomeIcons.refresh,
                    size: 50.sp,
                    color: GlobalVariables.callToActionColor,
                  ),
                  onTap: () => {},
                ),
              ],
            ),
            ListActivity(
              activity: 'Total Products',
              function: ()=>{
              },
              numberOfTimesRepeated: 9087,
              color: Colors.green,
              icon: FontAwesomeIcons.chartPie,
            ),
            ListActivity(
              activity: 'Vendors Information',
              function: ()=>{
              },
              numberOfTimesRepeated: 90,
              color: Colors.black45,
              icon: FontAwesomeIcons.buysellads,
            ),
            ListActivity(
              activity: 'Reports and stats',
              function: ()=>{
              },
              numberOfTimesRepeated: 500,
              color: Colors.deepPurple,
              icon: FontAwesomeIcons.chartLine,
            ),
            ListActivity(
              activity: 'Loans Statistics',
              function: ()=>{
              },
              numberOfTimesRepeated: 120,
              color: Colors.black,
              icon: FontAwesomeIcons.stackExchange,
            ),
            ListActivity(
              activity: 'Manage Customers',
              function: ()=>{
              },
              numberOfTimesRepeated: 90,
              color: Colors.blueAccent,
              icon: FontAwesomeIcons.clipboardUser,
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding:  EdgeInsets.all(20.0.sp),
              child: Column(
                children: [
                  Row(children:  [
                          Text("Inventory Summary In Quantity",style: TextStyle(fontSize: 50.sp),),
                  ],),
                  SizedBox(height: 20.h,),
                  Container(
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
                    child: Row(
                      children: [
                        SizedBox(width: 20.w,),
                        Container(
                          height: 250.h,
                          width: 10.w,
                          color: Colors.yellow,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(55.0.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("In Hand",style: TextStyle(fontSize: 40.sp),),
                                  Text("899",style: TextStyle(fontSize: 40.sp),),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.w,),

                          ],
                        ),
                        SizedBox(width: 190.w,),
                        Container(
                          height: 250.h,
                          width: 10.w,
                          color: Colors.blue,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(55.0.sp),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("In Hand",style: TextStyle(fontSize: 40.sp),),
                                  Text("899",style: TextStyle(fontSize: 40.sp),),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.w,),

                          ],
                        ),
                      ],
                    )
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
