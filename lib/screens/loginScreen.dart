import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:odoapplications/CustomWidget/CustomTextField.dart';
import 'package:odoapplications/screens/mainScreen.dart';
import 'package:odoapplications/screens/registerScreen.dart';

import '../CustomWidget/custombutton.dart';
import '../globalVariables/global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void fun(){  Get.off(const MainScreen());}
  void funREg(){  Get.to(const RegisterUser());}
  @override
  Widget build(BuildContext context) {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Padding(
          padding: EdgeInsets.all(80.0.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Image.asset("assets/images/odotechLogo.jpg", height: 220.h),
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 99.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  "to access inventory records",
                  style: TextStyle(
                      fontSize: 40.0.sp,
                      fontFamily: 'Hind',
                      color: Colors.black54),
                ),
                CustomTextField(controller: controller, hintText: " Email or PhoneNumber"),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(controller: controllerPassword, hintText: " Password"),
                SizedBox(
                  height: 100.h,
                ),
                CustomButton(
                  fun,
                  widgetChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "NEXT",
                        style: TextStyle(
                            fontSize: 40.0.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "lato",
                            color: Colors.white),
                      ),
                    ],
                  ),
                  width: 1400,
                  height: 100,
                  buttonColor: GlobalVariables.callToActionColor,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  GestureDetector(
                    onTap: fun,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontSize: 46.0.sp,
                          fontFamily: 'Hind',
                          color: GlobalVariables.callToActionColor),
                    ),
                  ),
                ],),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "|",
                      style: TextStyle(
                          fontSize: 46.0.sp,
                          fontFamily: 'Hind',
                          color: GlobalVariables.callToActionColor),
                    ),
                  ],),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(onPressed: funREg,
                  style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black26)), child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      size: 60.sp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 95.w,
                    ),
                    Text(
                      "Create Account",
                      style: TextStyle(fontSize: 50.0.sp,   fontFamily: 'Hind', fontWeight:FontWeight.bold,color:Colors.white),
                    ),
                  ],
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
