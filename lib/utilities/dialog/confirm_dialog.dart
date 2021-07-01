import '../../widgets/button.dart';
import 'package:flutter/material.dart';

import 'dialog_manager.dart';

void showConfirmDialog(
    {required BuildContext context,
    String? title,
    required String message,
    required Function onConfirm,
    Function? onCancel}) {
  DialogManager.show(
    context: context,
    builder: (context) {
      return _Dialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}

class _Dialog extends StatelessWidget {
  final String? title;
  final String message;
  final Function onConfirm;
  final Function? onCancel;

  const _Dialog(
      {Key? key, this.title,required this.message,required this.onConfirm, this.onCancel})
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
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: XeButton(
                    onPressed: () {
                      if (onCancel != null) {
                        onCancel!();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    text: 'Huỷ',
                    otherStyle: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: XeButton(
                    onPressed: () {
                      onConfirm();
                    },
                    text: 'Đồng ý',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
