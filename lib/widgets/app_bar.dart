import 'package:flutter/material.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  bool isBack = true,
  double? elevation,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    centerTitle: false,
    elevation: elevation,
    titleSpacing: isBack ? 0 : NavigationToolbar.kMiddleSpacing,
    automaticallyImplyLeading: false,
    leading: isBack
        ? IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_outlined),
          )
        : null,
    actions: actions,
  );
}
