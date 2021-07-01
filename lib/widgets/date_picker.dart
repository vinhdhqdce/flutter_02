import 'package:flutter/material.dart';

double _kPickerSheetHeight = 200.0;

Widget buildDatePicker(Widget picker) {
  return Container(
    height: _kPickerSheetHeight,
    color: Colors.grey.shade50,
    padding: const EdgeInsets.only(top: 6.0),
    child: DefaultTextStyle(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22.0,
      ),
      child: GestureDetector(
        onTap: () {},
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
}
