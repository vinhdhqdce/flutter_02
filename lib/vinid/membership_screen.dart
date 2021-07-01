import 'package:flutter/material.dart';

import '../Utils/components.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: 'Đặc quyền',
        isBack: false,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(),
    );
  }
}
