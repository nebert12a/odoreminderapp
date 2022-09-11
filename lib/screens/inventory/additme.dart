import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../CustomWidget/CustomTextField.dart';
import '../../globalVariables/utils.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  List<File> images = [];
  final _addItemFormKey = GlobalKey<FormState>();
  TextEditingController itemName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController sellingPrice = TextEditingController();
  TextEditingController purchasePrice = TextEditingController();
  TextEditingController openingStock = TextEditingController();
  TextEditingController openingStockValue = TextEditingController();
  TextEditingController openingStockRecord = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController recordLevel = TextEditingController();
  TextEditingController vendor = TextEditingController();
  TextEditingController manufacturer = TextEditingController();
  TextEditingController brand = TextEditingController();

  Future<bool> buildOnWillpop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text(
                'Changes will be discarded once you leave this page'),
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
        )) ??
        false;
  }
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

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
                  "Add Item",
                  style: TextStyle(fontSize: 48.sp),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () => {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Save",
                                style: TextStyle(fontSize: 48.sp),
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
                Text(
                  "Item Information",
                  style: TextStyle(
                      fontSize: 50.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 100.h,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                  items: images.map(
                        (i) {
                      return Builder(
                        builder: (BuildContext context) => Image.file(
                          i,
                          fit: BoxFit.cover,
                          height: 900.h,
                          width: 1000.w,
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 900.h,

                  ),
                )
                    : GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(30.r),
                    dashPattern: const [10, 4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: 940.w,
                      height: 600.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.folder,
                            size: 160.sp,
                          ),
                          Text(
                            "Add Image Of Item",
                            style: TextStyle(
                              fontSize: 50.0.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(controller: itemName, hintText: "Item name",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: barcode, hintText: "Barcode number",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: phoneNumber, hintText: "Quantity of Item",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Sales Information",
                  style: TextStyle(
                      fontSize: 60.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: sellingPrice, hintText: "Selling Price",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Purchase Information",
                  style: TextStyle(
                      fontSize: 60.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: purchasePrice, hintText: "Purchase Price",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Track Inventory For This Item",
                  style: TextStyle(
                      fontSize: 60.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: openingStock, hintText: "Opening Stock",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: openingStockValue,
                    hintText: "Opening Stock Price/value",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: openingStockValue, hintText: "Record Level",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: vendor, hintText: "Preferred Vendor",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "More Fields For This Item",
                  style: TextStyle(
                      fontSize: 60.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(
                    controller: manufacturer,
                    hintText: "Manufacturer Of Stock",val: false,),
                SizedBox(
                  height: 100.h,
                ),
                CustomTextField(controller: brand, hintText: "Brand",val: false,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
