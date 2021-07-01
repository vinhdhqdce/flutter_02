import 'package:flutter/material.dart';

class BlueScreen extends StatefulWidget {
  const BlueScreen({Key? key}) : super(key: key);

  @override
  _BlueScreenState createState() => _BlueScreenState();
}

class _BlueScreenState extends State<BlueScreen> with AutomaticKeepAliveClientMixin {//Khong khoi tao lai khi chuyen tabbar khi dung tabbarview
  @override
  Widget build(BuildContext context) {
    print('blue');
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
