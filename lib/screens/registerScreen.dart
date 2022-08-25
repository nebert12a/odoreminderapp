import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:odoapplications/globalVariables/global.dart';

import '../CustomWidget/CustomTextField.dart';
import 'loginScreen.dart';
import 'mainScreen.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    void funReg(){Get.to(const MainScreen());}
    void fun(){ Get.to(const LoginScreen());}
    TextEditingController companyName= TextEditingController();
    TextEditingController fullName= TextEditingController();
    TextEditingController emailAddress= TextEditingController();
    TextEditingController password= TextEditingController();
    TextEditingController country= TextEditingController();
    return SafeArea(child: Scaffold(
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
                "Simplify Inventory Management",
                style: TextStyle(
                    fontSize: 60.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: companyName, hintText: "Company name"),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: fullName, hintText: "Full name"),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: emailAddress, hintText: "Email address"),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: password, hintText: "password"),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: country, hintText: "Choose Country"),
              SizedBox(
                height: 100.h,
              ),
              ElevatedButton(onPressed: fun,
                style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(GlobalVariables.callToActionColor)), child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(fontSize: 50.0.sp,   fontFamily: 'Hind', fontWeight:FontWeight.bold,color:Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "or",
                    style: TextStyle(
                        fontSize: 46.0.sp,
                        fontFamily: 'Hind',
                        color: GlobalVariables.callToActionColor),
                  ),
                ],),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(onPressed: fun,
                style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)), child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 50.0.sp,   fontFamily: 'Hind', fontWeight:FontWeight.bold,color:Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
