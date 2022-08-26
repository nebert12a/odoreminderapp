import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odoapplications/globalVariables/global.dart';

import '../CustomWidget/activityWidget.dart';
import '../CustomWidget/listActivity.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 void helo(){
    print("helloooo");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150.h),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Company Name",
                  style: TextStyle(fontSize: 48.sp),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 10, top: 12),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          child: Icon(
                            Icons.notifications_outlined,
                            size: 70.sp,
                          ),
                          onTap: () => () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
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
                  activity: 'hi there shipment',
                  function: ()=>{
                  },
                  numberOfTimesRepeated: 90,
                  color: Colors.black,
                  icon: FontAwesomeIcons.notesMedical,
                ),
                ListActivity(
                  activity: 'home',
                  function: ()=>{

                  },
                  numberOfTimesRepeated: 70,
                  color: Colors.green,
                  icon: FontAwesomeIcons.simCard,
                ),
                ListActivity(
                  activity: 'final',
                  function:()=>{

                  },
                  numberOfTimesRepeated: 790,
                  color: Colors.red,
                  icon: FontAwesomeIcons.hireAHelper,
                ),
              ],
            ),
          ),
        ),
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: GlobalVariables.callToActionColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
