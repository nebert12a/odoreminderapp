import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:odoapplications/screens/loginScreen.dart';

import '../../globalVariables/global.dart';
import 'SearchScreen.dart';

class AllCustomerScreen extends StatefulWidget {
  const AllCustomerScreen({Key? key, required this.name, required this.totalExpenditure, required this.totalLoan, required this.function}) : super(key: key);
  final String name;
  final double totalExpenditure;
  final double totalLoan;
  final VoidCallback function;

  @override
  State<AllCustomerScreen> createState() => _AllCustomerScreenState();
}

class _AllCustomerScreenState extends State<AllCustomerScreen> {
  void navigateToSearchScreen(String query) {
    Get.to(const SearchScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.all(30.h),
            child: PreferredSize(
              preferredSize:  Size.fromHeight(200.h),
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200.h,
                        margin:  EdgeInsets.only(left: 15.w),
                        child: Material(
                          borderRadius: BorderRadius.circular(80.r),
                          elevation: 1,
                          child: TextFormField(
                            onFieldSubmitted: navigateToSearchScreen,
                            decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: () {},
                                child:  Padding(
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
                              contentPadding:  EdgeInsets.only(top: 10.h),
                              border:  OutlineInputBorder(
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
                              hintStyle:  TextStyle(
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
          Padding(padding:EdgeInsets.all(30.h),
            child: Container(
              decoration:  BoxDecoration(
                color: GlobalVariables.backgroundColor,
                boxShadow:[
                  BoxShadow(
                      blurRadius:30.h,
                      offset: Offset(3.sp,3.sp),
                      color: const Color(0xFFA7A9AF)
                  )
                ],

              ),
              height: 400.h,
              child: ListTile(
                title:   Text(
                    widget.name,
                  style: TextStyle(
                      fontSize: 60.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                subtitle:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:20.h),
                        Text(
                          "Total Purchase" ,
                          style: TextStyle(fontSize: 36.0.sp, color: Colors.black54),
                        ),
                        SizedBox(height:20.h),
                        Text(
                          widget.totalExpenditure.toString(),
                          style: TextStyle(fontSize: 60.0.sp,fontWeight: FontWeight.bold, color: Colors.black54),
                        ),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:20.h),
                        Text(
                          "Total Loan" ,
                          style: TextStyle(fontSize: 36.0.sp, color: Colors.black54),
                        ),
                        SizedBox(height:20.h),
                        Text(
                          widget.totalLoan.toString(),
                          style: TextStyle(fontSize: 60.0.sp,fontWeight: FontWeight.bold, color: Colors.black54),
                        ),

                      ],
                    ),
                  ],
                ),
                tileColor: Colors.white70,
                onTap: widget.function,
                enabled: true,
              ),
            ),),
        ],
      ),
    );
  }
}
