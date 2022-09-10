import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoapplications/globalVariables/global.dart';
import 'package:odoapplications/screens/customer/customerScreen.dart';

import '../inventory/itemsScreen.dart';
import 'activeCustomerScreen.dart';
import 'allCustomerScreen.dart';

class CustomerMainScreen extends StatefulWidget {
  const CustomerMainScreen({Key? key}) : super(key: key);

  @override
  State<CustomerMainScreen> createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String dropdownvalue = 'All Customer';
  var _sortType= 'Asc';
  late Widget _scaffoldBody;
  var items = [
    'All Customer',
    'Active Customer',
    'Unpaid Customer',
    'Overdue Customer',
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
                    if (dropdownvalue == "All Customer") {
                      _scaffoldBody = AllCustomerScreen(
                        name: 'juma',
                        totalLoan: 900,
                        totalExpenditure: 2000,
                        function: ()=>{},
                      );
                    } else if (dropdownvalue == "Active Customer") {
                          _scaffoldBody = ActiveCustomer(
                            name: 'juma',
                            totalLoan: 900,
                            totalExpenditure: 2000,
                            function: ()=>{},);

                    } else if (dropdownvalue == "Unpaid Customer") {
                      _scaffoldBody = const Text("Unpaid Customer again");
                    } else {
                      _scaffoldBody = const Text("Overdue Customer again");
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
                  Get.to(
                      const ItemsScreen( name: 'Item',
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
      body: _scaffoldBody,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 60.sp,
        ),
        onPressed: () => {Get.to(const CustomerScreen())},
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scaffoldBody = AllCustomerScreen(
      name: 'juma',
      totalLoan: 900,
      totalExpenditure: 2000,
      function: ()=>{},
    );
  }

  // Future<bool> buildOnWillpop() async {
  //   return (await showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: const Text('Are you sure?'),
  //           content: const Text('Do you want to exit an App'),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(false),
  //               child: const Text('No'),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(true),
  //               child: const Text('Yes'),
  //             ),
  //           ],
  //         ),
  //       )) ??
  //       false;
  // }
}
