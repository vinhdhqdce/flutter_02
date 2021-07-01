import '../Utils/components.dart';
import '../utilities/dialog/dialog_manager.dart';
import 'package:flutter/material.dart';

void showInputDialog(
    {required BuildContext context,
    String? title,
    required Function onConfirm,
    Function? onCancel}) {
  DialogManager.show(
    context: context,
    builder: (context) {
      return _SystemPadding(
        child: InputDialog(
          title: title,
          onConfirm: onConfirm,
          onCancel: onCancel,
        ),
      );
    },
  );
}

class InputDialog extends StatefulWidget {
  final Function onConfirm;
  final Function? onCancel;
  final String? title;

  const InputDialog(
      {Key? key, required this.onConfirm, this.onCancel, this.title})
      : super(key: key);

  @override
  _InputDialogState createState() =>
      _InputDialogState(this.onConfirm, this.onCancel, this.title);
}

class _InputDialogState extends State<InputDialog> {
  final Function onConfirm;
  final Function? onCancel;
  final String? title;

  _InputDialogState(this.onConfirm, this.onCancel, this.title);

  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    userController.dispose();
    passController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? 'Input dialog',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Username',
            style: TextStyle(fontSize: 14, color: Colors.blueAccent),
          ),
          SizedBox(
            height: 4,
          ),
          inputTextField(
            controller: userController,
            context: context,
            keyboardType: TextInputType.text,
            hintText: 'Username',
            inputBorder: Color(0xFFEEEEEE),
            radiusBox: 24,
            heightBox: 48,
            fillColor: Colors.white,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Password',
            style: TextStyle(fontSize: 14, color: Colors.blueAccent),
          ),
          SizedBox(
            height: 4,
          ),
          inputTextField(
            controller: passController,
            context: context,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Password',
            inputBorder: Color(0xFFEEEEEE),
            radiusBox: 24,
            heightBox: 48,
            fillColor: Colors.white,
            obscureText: true,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (onCancel != null) {
                      onCancel!();
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    'Cancel',
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      elevation: MaterialStateProperty.all(5)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onConfirm(userController.text,passController.text);
                  },
                  child: Text('Confirm'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
