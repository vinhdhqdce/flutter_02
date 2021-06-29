import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar buildAppBar({
  required BuildContext context,
  required String title,
  TextStyle? titleTextStyle,
  Color? backGroundColor,
  bool isBack = true,
  double? elevation,
  List<Widget>? actions,
}) {
  return AppBar(
    title: Text(
      title,
      style: titleTextStyle ?? TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    centerTitle: false,
    elevation: elevation,
    titleSpacing: isBack ? 0 : NavigationToolbar.kMiddleSpacing,
    automaticallyImplyLeading: false,
    backgroundColor: backGroundColor ?? Theme.of(context).primaryColor,
    leading: isBack
        ? IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios_outlined),
          )
        : null,
    actions: actions,
  );
}

FloatingActionButton buildFloatingButton(String label, Icon icon, Function() action, {required BuildContext context}) {
  return FloatingActionButton.extended(
    onPressed: action,
    label: Text(label),
    icon: icon,
    backgroundColor: Theme.of(context).primaryColor,
  );
}

Widget inputTextField({
  required BuildContext context,
  TextEditingController? controller,
  required TextInputType keyboardType,
  bool obscureText = false,
  String? hintText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  required inputBorder,
  VoidCallback? onTapSuffixIcon,
  double radiusBox = 10,
  double heightBox = 48,
  Color? fillColor,
}) {
  return Container(
    height: heightBox,
    decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(radiusBox)),
    child: TextField(
      textAlign: TextAlign.start,
      controller: controller,
      autocorrect: false,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      inputFormatters: [LengthLimitingTextInputFormatter(100)],
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(heightBox / 2), //Huy cmt
        fillColor: Colors.white,
        hintText: hintText,
        // alignLabelWithHint: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radiusBox)),
          borderSide: BorderSide(color: inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radiusBox)),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        prefixIcon: prefixIcon != null ? GestureDetector(
          onTap: () {
            if (onTapSuffixIcon != null) {
              onTapSuffixIcon();
            }
          },
          child: Icon(prefixIcon),
        )
            : null
        ,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
          onTap: () {
            if (onTapSuffixIcon != null) {
              onTapSuffixIcon();
            }
          },
          child: Icon(suffixIcon),
        )
            : null,
      ),
    ),
  );
}


