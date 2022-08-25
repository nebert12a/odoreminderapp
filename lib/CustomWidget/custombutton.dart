import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odoapplications/globalVariables/global.dart';
class CustomButton extends StatelessWidget {
  const CustomButton(  this.onPressed,{Key? key,  required this.widgetChild, required this.width, required this.height, required this.buttonColor}) : super(key: key);
  final VoidCallback  onPressed;
  final Widget widgetChild;
  final double width;
  final double height;
  final Color buttonColor;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style:  ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>( Size(width.w, height.h),),
          backgroundColor: MaterialStateProperty.all(buttonColor), side: MaterialStateProperty.all(const BorderSide(style: BorderStyle.solid))
        ),
        child: widgetChild,
    );
  }
}
