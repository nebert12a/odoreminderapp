import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoapplications/globalVariables/global.dart';
import 'package:odoapplications/providers/companyProviders.dart';
import 'package:odoapplications/screens/notification/notification.dart';
import 'package:provider/provider.dart';

import 'customer/customerMainScreen.dart';
import 'dashboard/dashboard.dart';
import 'inventory/itemsScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void helo() {
    print("helloooo");
  }

  @override
  Widget build(BuildContext context) {
    final owner = Provider.of<CompanyProvider>(context).owner;
    return Scaffold(
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
                  owner.companyName == null
                      ? owner.companyName = "default"
                      : owner.companyName = owner.companyName!,
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
                        child: IconButton(
                          onPressed: () {
                            Get.to(const Notifications());
                          },
                          icon: Icon(
                            Icons.notifications_outlined,
                            size: 70.sp,
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
        body: const DashBoard(),
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
                  accountEmail: Text(owner.mailAddress == null
                      ? owner.mailAddress = "Default@gmail.com"
                      : owner.mailAddress = owner.mailAddress!),
                  accountName: Text(
                    owner.mailAddress == null
                        ? owner.mailAddress = "Default@gmail.com"
                        : owner.mailAddress = owner.mailAddress!,
                    style: const TextStyle(fontSize: 24.0),
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
                  title: Text(
                    'Inventory',
                    style: TextStyle(
                      fontFamily:
                          GoogleFonts.lato(fontSize: 29.0.sp).fontFamily,
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
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          // icon: Icons.add,
          backgroundColor: GlobalVariables.callToActionColor,
          overlayColor: Colors.black,
          children: [
            SpeedDialChild(
                child: (const Icon(
                  FontAwesomeIcons.addressBook,
                  color: Colors.white,
                )),
                label: "Loaned Customer",
                backgroundColor: Colors.deepOrangeAccent,
                onTap: () => {Get.to(const CustomerMainScreen())}),
            SpeedDialChild(
                child: (const Icon(
                  FontAwesomeIcons.bucket,
                  color: Colors.white,
                )),
                label: "Item",
                backgroundColor: Colors.greenAccent),
            SpeedDialChild(
                child: (const Icon(FontAwesomeIcons.cartShopping,
                    color: Colors.white)),
                label: "Bought Item",
                backgroundColor: Colors.lightBlue),
            SpeedDialChild(
                child:
                    (const Icon(FontAwesomeIcons.plus, color: Colors.white)),
                label: "Ordered Item",
                backgroundColor: Colors.blueGrey),
            SpeedDialChild(
                child: (const Icon(FontAwesomeIcons.receipt,
                    color: Colors.white)),
                label: "Business report",
                backgroundColor: Colors.purpleAccent),
            SpeedDialChild(
                child: (const Icon(FontAwesomeIcons.moneyBillTrendUp,
                    color: Colors.white)),
                label: "Personal review",
                backgroundColor: Colors.deepPurpleAccent),
          ],
        ));
  }
}
