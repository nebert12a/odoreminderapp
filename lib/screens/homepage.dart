import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:odoapplications/CustomWidget/custombutton.dart';
import 'package:odoapplications/globalVariables/global.dart';
import 'package:odoapplications/screens/corouselSlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odoapplications/screens/loginScreen.dart';
import 'package:odoapplications/screens/registerScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void fun() {
    Get.to(const LoginScreen());
  }
  void funReg() {
    Get.to(const RegisterUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CarouselImageF(),
            SizedBox(height: 100.h),
            CustomButton(
              fun,
              widgetChild: Row(
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
                    "Sing in with google",
                    style: TextStyle(fontSize: 50.0.sp, fontWeight:FontWeight.bold,color: GlobalVariables.backgroundTextColor),
                  ),
                ],
              ),
              width: 800,
              height: 100,
              buttonColor: Colors.black,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              fun,
              widgetChild: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login using email or phone",
                    style: TextStyle(
                        fontSize: 40.0.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "lato",
                        color: Colors.black),
                  ),
                ],
              ),
              width: 700,
              height: 100,
              buttonColor: Colors.white,
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  child: Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 95.w,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    FontAwesomeIcons.googlePlusG,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 95.w,
                ),
                const CircleAvatar(
                  child: Icon(
                    FontAwesomeIcons.linkedinIn,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 190.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account?",
                  style: TextStyle(fontSize: 40.sp),
                ),
                GestureDetector(
                  onTap: funReg,
                  child: Text(
                    " SingUp",
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: GlobalVariables.callToActionColor),

                  ),

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
