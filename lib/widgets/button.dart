import 'package:flutter/material.dart';

class XeButton extends StatefulWidget {
  final Function? onPressed;
  final double width;
  final double height;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final bool otherStyle;
  final IconData? iconData;

  const XeButton(
      {Key? key,
      this.onPressed,
      this.width = double.infinity,
      this.height = 44,
      required this.text,
      this.textColor = Colors.white,
      this.backgroundColor = Colors.pink,
      this.otherStyle = false,
      this.iconData})
      : super(key: key);

  @override
  _XeButtonState createState() => _XeButtonState();
}

class _XeButtonState extends State<XeButton> {
  var isEnable = true;

  @override
  Widget build(BuildContext context) {
    return widget.otherStyle ? otherStyle() : defaultStyle();
  }

  Widget defaultStyle() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(2)),
      child: widget.iconData == null
          ? FlatButton(
              onPressed: () {
                if (widget.onPressed != null && isEnable) {
                  isEnable = false;
                  widget.onPressed!();
                  Future.delayed(Duration(milliseconds: 500), () {
                    isEnable = true;
                  });
                }
              },
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              ),
            )
          : FlatButton.icon(
              onPressed: () {
                if (widget.onPressed != null && isEnable) {
                  isEnable = false;
                  widget.onPressed!();
                  Future.delayed(Duration(milliseconds: 500), () {
                    isEnable = true;
                  });
                }
              },
              icon: Icon(
                widget.iconData,
                color: Colors.white,
                size: 18,
              ),
              label: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              ),
            ),
    );
  }

  Widget otherStyle() {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: FlatButton(
        onPressed: () {
          if (widget.onPressed != null && isEnable) {
            isEnable = false;
            widget.onPressed!();
            Future.delayed(Duration(milliseconds: 500), () {
              isEnable = true;
            });
          }
        },
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
