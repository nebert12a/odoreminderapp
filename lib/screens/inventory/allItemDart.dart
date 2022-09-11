import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../globalVariables/global.dart';
import '../customer/SearchScreen.dart';
import 'additme.dart';
import 'itemDetailsScree.dart';

class AllItem extends StatefulWidget {
  const AllItem({
    Key? key,
  }) : super(key: key);

  // final String name;
  // final double totalExpenditure;
  // final double totalLoan;

  @override
  State<AllItem> createState() => _AllItemState();
}

void navigateToSearchScreen(String query) {
  Get.to(const SearchScreen());
}

class _AllItemState extends State<AllItem> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? Offset(3.sp, 3.sp) : Offset(10.sp, 10.sp);
    double blur = isPressed ? 10.r : 30.r;
    return Padding(
      padding:  EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w,bottom: 20.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30.h),
            child: PreferredSize(
              preferredSize: Size.fromHeight(200.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 200.h,
                      margin: EdgeInsets.only(left: 15.w),
                      child: Material(
                        borderRadius: BorderRadius.circular(80.r),
                        elevation: 1,
                        child: TextFormField(
                          onFieldSubmitted: navigateToSearchScreen,
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 6.w,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 65.sp,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(top: 10.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(70.r),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(70.r),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black38,
                                width: 5.w,
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(
           () => {
             isPressed = !isPressed,
                Get.to(ItemsDetails())
           }
            ),
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: GlobalVariables.backgroundColor,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: blur,
                    offset: -distance,
                    color: const Color(0xFFFFFFFF),
                    inset: isPressed,
                  ),
                  BoxShadow(
                    blurRadius: blur,
                    offset: distance,
                    color: const Color(0xFFA7A9AF),
                    inset: isPressed,
                  ),
                ],
              ),
              height: 500.h,
              duration: const Duration(milliseconds: 100),
              child: Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(

                    height: 300.h,
                    width: 300.w,
                    child: Image.asset("assets/images/odotechLogo.jpg"),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          Text(
                            "Item Name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.0.sp,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 70.h),
                          Text(
                            "Sales Price: ${89}",
                            style: TextStyle(
                                fontSize: 40.0.sp, color: Colors.black54),
                          ),
                          Text(
                            "Purchase Price: ${200}",
                            style: TextStyle(
                                fontSize: 40.0.sp, color: Colors.black54),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          DottedBorder(
                            child: Text(
                              "Item count ${900}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0.sp,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          SizedBox(height: 115.h),
                          Row(
                            children: [
                              SizedBox(width: 50.h),
                              Text(
                                "extra details",
                                style: TextStyle(
                                    fontSize: 36.0.sp,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
