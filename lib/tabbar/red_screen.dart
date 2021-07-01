import 'package:flutter/material.dart';

class RedScreen extends StatefulWidget {
  const RedScreen({Key? key}) : super(key: key);

  @override
  _RedScreenState createState() => _RedScreenState();
}

class _RedScreenState extends State<RedScreen> {
  @override
  Widget build(BuildContext context) {
    print('red');
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
