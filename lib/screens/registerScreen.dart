import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:odoapplications/globalVariables/global.dart';
import 'package:odoapplications/util/odoDbConn.dart';

import '../CustomWidget/CustomTextField.dart';
import '../model/compan_owner.dart';
import '../model/user.dart';
import '../util/companyDao.dart';
import 'loginScreen.dart';
import 'mainScreen.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  late User user;

  @override
  Widget build(BuildContext context) {
    TextEditingController companyName= TextEditingController();
    TextEditingController fullName= TextEditingController();
    TextEditingController emailAddress= TextEditingController();
    TextEditingController password= TextEditingController();
    TextEditingController country= TextEditingController();
    TextEditingController phoneNumber= TextEditingController();
    void loginOwner(){
      Get.to(const LoginScreen());
    }
    Future<void> registerOwner() async {

      final user = User(
        userName:fullName.toString(),
        userPassword: password.toString(),
        email: emailAddress.toString(),
        firstName: companyName.toString()
      );
      final companyOwner = CompanyOwner(
        companyName: companyName.text,
        ownerName: fullName.text,
        mailAddress: emailAddress.text,
        password: password.text,
        phoneNumber: phoneNumber.text,
        chooseCountry: country.text,
        creationDate: DateTime.now().toString()
      );
      final owner= await CompanyDao.createOwner(companyOwner);
      if(owner.id==null){

      }else
      {

        Get.to(const LoginScreen());
      }
      }
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
              CustomTextField(controller: companyName, hintText: "Company name",val: false,),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: fullName, hintText: "Full name",val: false,),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: emailAddress, hintText: "Email address",val: false,),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: password, hintText: "password",val: true,),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: phoneNumber, hintText: "Phone Number",val: false,),
              SizedBox(
                height: 100.h,
              ),
              CustomTextField(controller: country, hintText: "Choose Country",val: false,),
              SizedBox(
                height: 100.h,
              ),
              ElevatedButton(onPressed: registerOwner,
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
              ElevatedButton(onPressed: loginOwner,
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
