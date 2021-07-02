import 'package:demo_vin_id/Utils/fade_index_stack.dart';
import 'package:demo_vin_id/widgets/input_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/progess_dialog.dart';
import '../widgets/date_picker.dart';

import 'inbox_screen.dart';
import 'main_screen.dart';
import 'profile_screen.dart';

class VinIDApp extends StatefulWidget {
  const VinIDApp({Key? key}) : super(key: key);

  @override
  _VinIDAppState createState() => _VinIDAppState();
}

class _VinIDAppState extends State<VinIDApp>
    with SingleTickerProviderStateMixin {
  //add with for tab
  late MainScreen mainScreen;
  late InboxScreen membershipScreen;
  late InboxScreen scanScreen;
  late InboxScreen inboxScreen;
  late ProfileScreen profileScreen;

  final screens = <Widget>[];
  final items = <BottomNavigationBarItem>[];

  late TabController tabController;

  var currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    mainScreen = MainScreen();
    membershipScreen = InboxScreen();
    scanScreen = InboxScreen();
    inboxScreen = InboxScreen();
    profileScreen = ProfileScreen();

    screens.addAll([
      mainScreen,
      membershipScreen,
      scanScreen,
      inboxScreen,
      profileScreen,
    ]);

    items.addAll([
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.card_membership),
        activeIcon: Icon(Icons.card_membership),
        label: 'Đặc quyền',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.transparent,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        activeIcon: Icon(Icons.message),
        label: 'Hộp thư',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        activeIcon: Icon(Icons.person),
        label: 'Tài khoản',
      ),
    ]);

    tabController =
        TabController(initialIndex: 0, length: items.length, vsync: this);
    tabController.addListener(() {
      print('init');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildTabBar(),
      floatingActionButton: InkWell(
        onTap: (){
          DateTime dateTime = DateTime.now();

          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return buildDatePicker(CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                use24hFormat: true,
                initialDateTime: dateTime,
                onDateTimeChanged: (DateTime value) {
                  if (mounted) {
                    print('Selected date: ${value.toLocal().toString()}');
                    setState(() {
                      dateTime = value;
                    });
                  }
                },
              ));
            },
          );

        },
        child: Container(
          padding: const EdgeInsets.only(top: 52),
          child: Container(
            height: 40,
            width: 40,
            child: Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget buildTabBar() {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(fontSize: 12),
      selectedItemColor: Colors.red,
      backgroundColor: Colors.white,
      onTap: (index) {
        if(index == 1){
/*          final values = ['Hà Nội','HCM'];
          showValueBottomSheet(context: context, values: values);*/

// final values = ['Ha Noi', 'Sai gon'];
// showValueBottomSheet(
//   context: context,
//   title: 'Location',
//   values: values,
//   onSelected: (index, value) {
//     print('$value');
//   },
// );

// showConfirmDialog(
//   context: context,
//   message: 'Chắc chắn xoá?',
//   onConfirm: () {
//     print('_AppState.buildBottomNavigationBar');
//   },
// );

// showAlertDialog(context: context, message: 'Xin chao');
/*
          final progress = ProgressDialog(context: context);

          progress.show();
          Future.delayed(Duration(seconds: 5), (){
            progress.hide();
          });*/
          showInputDialog(context: context, onConfirm: (user,pass){
            print('confirm input dialog user: $user and pass: $pass');
          });
          
        }else
        if (index != currentTabIndex){
          setState(() {
            currentTabIndex = index;
          });
        }
      }

    );
  }

  Widget buildBody() {
    /*return IndexedStack(
      index: currentTabIndex,
      children: screens,
    );*/
    return FadeIndexedStack(index: currentTabIndex, children: screens);
  }
}
