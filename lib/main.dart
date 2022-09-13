import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:odoapplications/globalVariables/global.dart';
import 'package:odoapplications/providers/companyProviders.dart';
import 'package:odoapplications/screens/homepage.dart';
import 'package:odoapplications/screens/mainScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CompanyProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2280),
      builder: (BuildContext context, Widget? child) =>
          GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                useMaterial3: true,
                fontFamily: "lato",
                textTheme: TextTheme(
                  headline1: TextStyle(
                      fontSize: 99.0.sp,
                      fontWeight: FontWeight.bold,
                      color: GlobalVariables.backgroundTextColor),
                  headline6:
                  const TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                  bodyText2: const TextStyle(
                      fontSize: 14.0, fontFamily: 'Hind'),
                )),
            //home: const CustomerMainScreen(),
            home: const MyHomePage(),
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    // checkSignedInData();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late SharedPreferences preferences;
late String? ownerName;
late String? mail;
  //
  // void checkSignedInData() async {
  //
  // }

  Future<void> saveToNotifiers() async {
    preferences = await SharedPreferences.getInstance();
    final String? companyName = preferences.getString('companyName');
    final String? mailAddress = preferences.getString('mailAddress');
    ownerName=companyName;
    mail=mailAddress;
    Map<dynamic, dynamic> owner = {
      'companyName': companyName,
      'mailAddress': mailAddress
    };
      Provider.of<CompanyProvider>(context, listen: false).setOwner(owner);


  }
  @override
  void initState() {
    super.initState();
    saveToNotifiers();
    Timer(const Duration(seconds: 10), () =>
    {
      if(ownerName==null&&mail==null){
        Get.off(const HomePage())
      }
      else
        {
          Get.to(const MainScreen())
        }
    });

  }

  @override
  Widget build(BuildContext context) {
    final Size sizeContainer = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: sizeContainer.height / 2,
            width: sizeContainer.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/odotechLogo.jpg"),
                  fit: BoxFit.contain),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
