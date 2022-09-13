import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../CustomWidget/historyClass.dart';
import '../../globalVariables/global.dart';

class ItemsDetails extends StatelessWidget {
  ItemsDetails({Key? key}) : super(key: key);
  final items = ["Mark As inActive", "Delete"];
  List images = ['assets/images/slider1.jpg'];

  @override
  Widget build(BuildContext context) {
    Future<bool> buildOnWillpop(String type) async {
      return (

          await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:  Text('$type Description'),
          content: const Text(
              'Changes will be discarded once you leave this page'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      )) ??
          false;
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.h),
          child: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 70.sp,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          PopupMenuButton<String>(
                            icon:  Icon(Icons.more_vert,     size: 70.sp,),
                            onSelected: (String result) {
                              switch (result) {
                                case 'in-active':
                                  print("helllo there");
                                  break;
                                case 'Delete':
                                  print("helllo there");
                                  break;
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                  value: "in-active",
                                  child: Text("Mark as Inactive")),
                              const PopupMenuItem(
                                  value: "Delete", child: Text("Delete"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 600.h,
              child: Padding(
                padding: EdgeInsets.only(left: 60.0.w, right: 120.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Item Name",
                      style: TextStyle(fontSize: 40.sp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              "Selling Price",
                              style: TextStyle(fontSize: 40.sp),
                            ),
                            Text(
                              "xxxxxxxxxxxx",
                              style: TextStyle(fontSize: 60.sp),
                            ),
                            SizedBox(
                              height: 90.h,
                            ),
                            Text(
                              "Purchase Price",
                              style: TextStyle(fontSize: 40.sp),
                            ),
                            Text(
                              "xxxxxxxxxxxx",
                              style: TextStyle(fontSize: 60.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 90.h,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {print("hi there")},
                            child: Container(
                              width: 500.w,
                              height: 500.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/odotechLogo.jpg"),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 190.h,
              decoration: BoxDecoration(
                color: GlobalVariables.callToActionColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 70.r,
                      offset: Offset(3.sp, 3.sp),
                      color: const Color(0xFFA7A9AF))
                ],
              ),
              child:  TabBar(
                tabs: [
                  Tab(
                    icon: const Icon(Icons.info_outline),
                    child: Text(
                      "Details",
                      style:
                          TextStyle(
                              fontSize: 32.sp,
                              color: GlobalVariables.backgroundTextColor),
                    ),
                  ),
                  Tab(
                    icon: const Icon(
                      Icons.adjust,
                    ),
                    child: Text("Adjustments",style: TextStyle(   fontSize: 32.sp,),),
                  ),
                  Tab(
                    icon: const Icon(
                      Icons.history,
                    ),
                    child: Text("History",style: TextStyle(   fontSize: 32.sp,),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: GlobalVariables.backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 30.h,
                                  offset: Offset(3.sp, 3.sp),
                                  color: const Color(0xFFA7A9AF))
                            ],
                          ),
                          height: 500.h,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 60.0.w, right: 120.0.w, top: 50.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.moneyBillTrendUp,
                                        ),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Text(
                                          "Stock Summary",
                                          style: TextStyle(fontSize: 45.sp),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text("Accounting"),
                                              SizedBox(
                                                width: 110.w,
                                              ),
                                              const Text("Physical"),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("Stock on hand"),
                                                  const Text("Commited Stock"),
                                                  const Text(
                                                      "Available For Sale"),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text("100"),
                                                  const Text("0"),
                                                  const Text("100"),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  const Text("100"),
                                                  const Text("0"),
                                                  const Text("100"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: GlobalVariables.backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 30.h,
                                  offset: Offset(3.sp, 3.sp),
                                  color: const Color(0xFFA7A9AF))
                            ],
                          ),
                          height: 500.h,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 60.0.w, right: 120.0.w, top: 50.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                            Icons.monitor_heart_outlined),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Text(
                                          "Stock Status",
                                          style: TextStyle(fontSize: 45.sp),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("0 Qty"),
                                                  const Text("To be Sold"),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("100 Qty"),
                                                  const Text("To be Recieved"),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("102 Qty"),
                                              const Text("To be Invoiced"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: GlobalVariables.backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 30.h,
                                  offset: Offset(3.sp, 3.sp),
                                  color: const Color(0xFFA7A9AF))
                            ],
                          ),
                          height: 600.h,
                          child: Column(
                            children: [

                              Padding(
                                padding: EdgeInsets.only(
                                    left: 60.0.w, right: 120.0.w, top: 50.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.business_center,
                                        ),
                                        SizedBox(
                                          width: 25.w,
                                        ),
                                        Text(
                                          "Sales & Purchase Information",
                                          style: TextStyle(fontSize: 45.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    DottedBorder(
                                      borderType: BorderType.RRect,
                                      child: Padding(
                                        padding: EdgeInsets.only(left:25.w,top: 8.0.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text("Selling Price"),
                                                SizedBox(
                                                  width: 310.w,
                                                ),
                                                const Text("Purchase Cost"),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "tsh 8990",
                                                      style: TextStyle(
                                                          fontSize: 50.sp),
                                                    ),
                                                     Text("Per Item Name",
                                                      style: TextStyle(
                                                          fontSize: 37.sp),),
                                                    TextButton(
                                                        onPressed: ()=>{  buildOnWillpop('Purchase')},
                                                        child:  Text("Show Description", style: TextStyle(
                                                            fontSize: 37.sp),)),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 178.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "tsh 6990",
                                                      style: TextStyle(
                                                          fontSize: 50.sp),
                                                    ),
                                                     Text("Per Item Name",
                                                       style: TextStyle(
                                                           fontSize: 35.sp),),
                                                    TextButton(
                                                        onPressed: ()=>{
                                                          buildOnWillpop('Sales')
                                                        },
                                                        child:   Text("Show Description", style: TextStyle(
                                                            fontSize: 35.sp),)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [

                      ],
                    ),
                  ),

                   SingleChildScrollView(
                    child: Column(
                      children: const [
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                        HistoryClass(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
