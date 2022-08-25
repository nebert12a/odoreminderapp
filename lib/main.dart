import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:odoapplications/globalVariables/global.dart';
import 'package:odoapplications/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080,2280),
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          fontFamily: "lato",
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 99.0.sp, fontWeight:FontWeight.bold,color: GlobalVariables.backgroundTextColor),
            headline6: const TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: const TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () => Get.off(const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeContainer= MediaQuery.of(context).size;

    return  Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: sizeContainer.height/2,
                width: sizeContainer.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/odotechLogo.jpg"),
                  fit: BoxFit.contain),

                ),
              ),
              SizedBox(height: 100.h,),
              const CircularProgressIndicator(),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
