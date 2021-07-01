import 'package:flutter/material.dart';
import '../../widgets/button.dart';

import 'dialog_manager.dart';

void showAlertDialog({
  required BuildContext context,
  String? title,
  required String message,
  bool barrierDismissible = true,
  Function? onDone,
}) {
  DialogManager.show(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return _Dialog(
        title: title,
        message: message,
        onDone: onDone,
      );
    },
  );
}

class _Dialog extends StatelessWidget {
  final String? title;
  final String message;
  final Function? onDone;

  const _Dialog({Key? key, this.title,required this.message, this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title ?? 'NoiBai Taxi',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 16,
            ),
            XeButton(
              onPressed: () {
                if (onDone != null) {
                  onDone!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              text: 'Xong',
            )
          ],
        ),
      ),
    );
  }
}
