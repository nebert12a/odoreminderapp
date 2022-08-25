import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../globalVariables/global.dart';

class CarouselImageF extends StatelessWidget {
  const CarouselImageF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImagesS
          .map((item) => Center(
        child: Image.asset(
          item,
          fit: BoxFit.scaleDown,
          height: 800.h,
          width: 1080.w,
        ),
      ))
          .toList(),
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        viewportFraction: 1,
        height: 900.h,
        enlargeCenterPage: true,
      ),
    );
  }
}
