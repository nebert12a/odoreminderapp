import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:odoapplications/CustomWidget/CustomTextField.dart';
import 'package:odoapplications/screens/mainScreen.dart';
import 'package:odoapplications/screens/registerScreen.dart';
import 'package:odoapplications/util/companyDao.dart';
import 'package:provider/provider.dart';

import '../CustomWidget/custombutton.dart';
import '../globalVariables/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/companyProviders.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  Future<void> loginOwner() async {
    List<Map> owner= await CompanyDao.loginOwner(emailController.text, controllerPassword.text);
      if(owner.isEmpty)
        {
          controllerPassword.clear();
          emailController.clear();
        }
      else{
        for (var element in owner) {
          if(element["mailAddress"]==emailController.text&&element["password"]== controllerPassword.text)
          {
            SharedPreferences pref = await SharedPreferences.getInstance();
            myAsyncMethod(element);
           await pref.setString('mailAddress', element["mailAddress"]);
            await pref.setString('companyName', element["companyName"]);
            Get.off(const MainScreen());
          }
          else{

            print("Wrong Information");
            controllerPassword.clear();
            emailController.clear();

          }
      }

    }

  }
   myAsyncMethod(Map owner){
    Provider.of<CompanyProvider>(context,listen: false).setOwner(owner);
  }

  void registerOwner() {
    Get.to(const RegisterUser());
  }

  @override
  void dispose() {
    super.dispose();
    controllerPassword.clear();
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
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
                CustomTextField(
                    controller: emailController, hintText: " Email or PhoneNumber",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: controllerPassword, hintText: " Password",val: true,),
                SizedBox(
                  height: 100.h,
                ),
                CustomButton(
                  loginOwner,
                  widgetChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 55.0.sp,
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
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                  onPressed: registerOwner,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          GlobalVariables.backgroundColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        size: 60.sp,
                        color:  GlobalVariables.callToActionColor,
                      ),
                      SizedBox(
                        width: 95.w,
                      ),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 50.0.sp,
                          fontFamily: 'Hind',
                          fontWeight: FontWeight.bold,
                          color:  GlobalVariables.callToActionColor,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 90.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: loginOwner,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontSize: 46.0.sp,
                            fontFamily: 'Hind',
                            color: GlobalVariables.callToActionColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
