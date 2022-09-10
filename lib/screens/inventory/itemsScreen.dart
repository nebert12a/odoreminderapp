import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoapplications/screens/inventory/additme.dart';

import '../../globalVariables/global.dart';
import '../customer/SearchScreen.dart';
import '../customer/activeCustomerScreen.dart';
import '../customer/allCustomerScreen.dart';
import '../customer/customerMainScreen.dart';
import 'itemDetailsScree.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key, required this.name, required this.totalExpenditure, required this.totalLoan}) : super(key: key);
  final String name;
  final double totalExpenditure;
  final double totalLoan;

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {

  void navigateToSearchScreen(String query) {
    Get.to(const SearchScreen());
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownvalue = 'All Items';
  var _sortType= 'Asc';
  late Widget _scaffoldBody;
  var items = [
    'All Items',
    'Active items',
    'Ungrouped item',
    'Low Stock item',
    'Inactive items',
    'Service',

  ];

  _handleDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  void _showSettingsBottomModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 125,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Sort mode',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 12),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(2.0),
                    selectedBorderColor: Theme.of(context).colorScheme.primary,
                    onPressed: (int index) {
                      setModalState(() {
                        setState(() {
                          _sortType = index == 0
                              ? 'Asc'
                              :'Desc';
                        });
                      });
                    },
                    isSelected: <bool>[
                      _sortType == 'Asc',
                      _sortType == 'Desc',
                    ],
                    children: const <Widget>[
                      Text('Asc'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Desc'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Icon(
                    FontAwesomeIcons.user,
                    size: 110.sp,
                  ),
                ),
                accountEmail: const Text('Test@gmail.com'),
                accountName: const Text(
                  'Signed name',
                  style: TextStyle(fontSize: 24.0),
                ),
                decoration: const BoxDecoration(
                    color: GlobalVariables.callToActionColor),
              ),
              ListTile(
                leading: const Icon(Icons.house),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {},

              ),
              ListTile(
                leading: const Icon(Icons.inventory_2_outlined),
                title:  Text(
                  'Inventory',
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato (
                        fontSize: 29.0.sp
                    ).fontFamily,
                  ),
                ),
                onTap: () {
                  Get.to(const ItemsScreen( name: 'juma',
                    totalLoan: 900,
                    totalExpenditure: 2000,));
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.person),
                title: Text(
                  'Customer',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {
                  Get.to(const CustomerMainScreen());
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.receipt),
                title: Text(
                  'Business report',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.business_center),
                title: Text(
                  'Vendors',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: Text(
                  'Purchase Orders',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.rate_review_sharp),
                title: Text(
                  'Bills',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.feedback_outlined),
                title: Text(
                  'Feedback',
                  style: TextStyle(
                    fontFamily:
                    GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
        child: AppBar(
          leading: GestureDetector(
            onTap: _handleDrawer,
            child: Icon(
              Icons.menu,
              size: 70.sp,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 20.w,
              ),
              DropdownButton(

                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    if (dropdownvalue == "All Items") {
                      _scaffoldBody = const Text("All item again");
                    } else if (dropdownvalue == "Active items") {
                      _scaffoldBody = const Text("Active item again");
                    } else if (dropdownvalue == "Ungrouped item") {
                      _scaffoldBody = const Text("Ungrouped item again");
                    }
                    else if (dropdownvalue == "Low Stock item") {
                    _scaffoldBody = const Text("Low Stock item again");
                    }
                    else if (dropdownvalue == "Inactive items") {
                    _scaffoldBody = const Text("Inactive items again");
                    }
                    else {
                      _scaffoldBody = const Text("Service");
                    }
                  });
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50.w,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.sort,
                            size: 70.sp,
                          ),
                          onPressed: () {
                            _showSettingsBottomModalSheet(context);
                          },
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
      body: Column(),
      // Column(
      //   children: [
      //     Padding(
      //       padding:EdgeInsets.all(30.h),
      //       child: PreferredSize(
      //         preferredSize:  Size.fromHeight(200.h),
      //         child:  Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Expanded(
      //               child: Container(
      //                 height: 200.h,
      //                 margin:  EdgeInsets.only(left: 15.w),
      //                 child: Material(
      //                   borderRadius: BorderRadius.circular(80.r),
      //                   elevation: 1,
      //                   child: TextFormField(
      //                     onFieldSubmitted: navigateToSearchScreen,
      //                     decoration: InputDecoration(
      //                       prefixIcon: InkWell(
      //                         onTap: () {},
      //                         child:  Padding(
      //                           padding: EdgeInsets.only(
      //                             left: 6.w,
      //                           ),
      //                           child: Icon(
      //                             Icons.search,
      //                             color: Colors.black,
      //                             size: 65.sp,
      //                           ),
      //                         ),
      //                       ),
      //                       filled: true,
      //                       fillColor: Colors.white,
      //                       contentPadding:  EdgeInsets.only(top: 10.h),
      //                       border:  OutlineInputBorder(
      //                         borderRadius: BorderRadius.all(
      //                           Radius.circular(70.r),
      //                         ),
      //                         borderSide: BorderSide.none,
      //                       ),
      //                       enabledBorder: OutlineInputBorder(
      //                         borderRadius: BorderRadius.all(
      //                           Radius.circular(70.r),
      //                         ),
      //                         borderSide: BorderSide(
      //                           color: Colors.black38,
      //                           width: 5.w,
      //                         ),
      //                       ),
      //                       hintText: 'Search',
      //                       hintStyle:  TextStyle(
      //                         fontWeight: FontWeight.w500,
      //                         fontSize: 40.sp,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Padding(padding:EdgeInsets.all(30.h),
      //       child: Container(
      //         decoration:  BoxDecoration(
      //           color: GlobalVariables.backgroundColor,
      //           boxShadow:[
      //             BoxShadow(
      //                 blurRadius:30.h,
      //                 offset: Offset(3.sp,3.sp),
      //                 color: const Color(0xFFA7A9AF)
      //             )
      //           ],
      //
      //         ),
      //         height: 400.h,
      //         child: ListTile(
      //           title:   Text(
      //             widget.name,
      //             style: TextStyle(
      //                 fontSize: 60.0.sp,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.black54),
      //           ),
      //           subtitle:  Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   SizedBox(height:20.h),
      //                   Text(
      //                     "Total Purchase" ,
      //                     style: TextStyle(fontSize: 36.0.sp, color: Colors.black54),
      //                   ),
      //                   SizedBox(height:20.h),
      //                   Text(
      //                     widget.totalExpenditure.toString(),
      //                     style: TextStyle(fontSize: 60.0.sp,fontWeight: FontWeight.bold, color: Colors.black54),
      //                   ),
      //
      //                 ],
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   SizedBox(height:20.h),
      //                   Text(
      //                     "Total Loan" ,
      //                     style: TextStyle(fontSize: 36.0.sp, color: Colors.black54),
      //                   ),
      //                   SizedBox(height:20.h),
      //                   Text(
      //                     widget.totalLoan.toString(),
      //                     style: TextStyle(fontSize: 60.0.sp,fontWeight: FontWeight.bold, color: Colors.black54),
      //                   ),
      //
      //                 ],
      //               ),
      //             ],
      //           ),
      //           tileColor: Colors.white70,
      //           onTap: ()=>{
      //             Get.to( ItemsDetails())
      //           },
      //           enabled: true,
      //         ),
      //       ),),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 60.sp,
        ),
        onPressed: () => {Get.to(const AddItem())},
      ),
    );
  }
}
