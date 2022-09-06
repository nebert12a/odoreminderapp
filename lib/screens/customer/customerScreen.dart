import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CustomWidget/CustomTextField.dart';
import '../../globalVariables/global.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  TextEditingController customerName= TextEditingController();
  TextEditingController phoneNumber= TextEditingController();
  TextEditingController emailAddress= TextEditingController();
  TextEditingController customerType= TextEditingController();
  TextEditingController country= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: buildOnWillpop,
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
                  "New Customer",
                  style: TextStyle(fontSize: 48.sp),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 10, ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),

                      child: GestureDetector(
                        onTap: ()=>{},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Save",
                              style:  TextStyle(fontSize: 48.sp),
                            ),

                          ],

                          ),
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
          padding: EdgeInsets.all(80.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Customer Information",
                  style: TextStyle(
                      fontSize: 60.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(controller: customerName, hintText: "Customer name"),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(controller: emailAddress, hintText: "Email address"),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(controller: phoneNumber, hintText: "Phone Number"),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(controller: country, hintText: "Choose Country"),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Other Details",
                  style: TextStyle(
                      fontSize: 60.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(controller: customerType, hintText: "Customer Type"),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> buildOnWillpop() async{
    return ( await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Changes will be discarded once you leave this page'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }
}
