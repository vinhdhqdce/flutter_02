import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/ellipse.png'),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/ellipse2.png'),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/ellipse3.png'),
          ),
          SingleChildScrollView(child: buildBody(),),
          buildBottom(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () {
        // Sự kiện click ra ngoài thì ẩn bàn phím
        hideKeyboard();
      },
      child: Container(
        margin: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          // verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            // label sign up
            //Full name
            SizedBox(
              height: 31,
            ),
            Text(
              'Full name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9796A1),
              ),
            ),
            // label full name
            SizedBox(
              height: 12,
            ),
            myTextField(
              keyboardType: TextInputType.text,
              hintText: 'Enter your full name',
              inputBorder: Color(0xFFEEEEEE),
            ),
            //Email
            SizedBox(
              height: 29,
            ),
            Text(
              'E-mail',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9796A1),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            myTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Enter your email address',
              inputBorder: Color(0xFFEEEEEE),
            ),
            //Password
            SizedBox(
              height: 29,
            ),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9796A1),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            myTextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              hintText: 'Enter your password',
              suffixIcon: Icons.remove_red_eye,
              onTapSuffixIcon: showHidePassword,
              inputBorder: Color(0xFFEEEEEE),
            ),
            //Button Sign up
            SizedBox(
              height: 33,
            ),
            signUpButton(),
            //Login link
            SizedBox(
              height: 33,
            ),
            signInLink(),
            //Sign up with
            SizedBox(
              height: 54,
            ),
          ],
        ),
      ),
    );
  }

  Widget myTextField({
    TextEditingController? controller,
    required TextInputType keyboardType,
    bool obscureText = false,
    String? hintText,
    IconData? suffixIcon,
    inputBorder,
    VoidCallback? onTapSuffixIcon,
  }) {
    return Container(
      height: 65,
      child: TextField(
        controller: controller,
        autocorrect: false,
        keyboardType: keyboardType,
        textCapitalization: TextCapitalization.words,
        inputFormatters: [LengthLimitingTextInputFormatter(100)],
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
            borderSide: BorderSide(color: inputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
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

  Widget signUpButton() {
    return Center(
      child: Container(
        width: 248,
        height: 60,
        child: ElevatedButton(
          onPressed: signUpAction,
          child: Text(
            'SIGN UP',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              shadowColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
              elevation: MaterialStateProperty.all(5)),
        ),
      ),
    );
  }

  Widget signInLink() {
    return GestureDetector(
      onTap: signUpAction,
      child: Center(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(color: Color(0xFF5B5B5E))),
            TextSpan(
                text: 'Login',
                style: TextStyle(color: Theme.of(context).primaryColor)),
          ]),
        ),
      ),
    );
  }

  Widget signUpWith() {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 1,
          color: Colors.grey[400],
        )),
        Text('   Sign up with   '),
        Expanded(
            child: Container(
          height: 1,
          color: Colors.grey[400],
        )),
      ],
    );
  }

  Widget socialSignUp() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: signUpAction,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/logo_facebook.png",
                      height: 38,
                      width: 38,
                    )),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'FACEBOOK',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 13),
                  ),
                ),
              ),
            ]),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              shadowColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all(5),
              fixedSize: MaterialStateProperty.all(Size.fromHeight(57)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: signUpAction,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/logo_google.png",
                      height: 38,
                      width: 38,
                    )),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'GOOGLE',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 13),
                  ),
                ),
              ),
            ]),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              shadowColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all(5),
              fixedSize: MaterialStateProperty.all(Size.fromHeight(57)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBottom() {
    return Container(
      margin: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.up,
        children: [
          SizedBox(
            height: 28,
          ),
          socialSignUp(),
          SizedBox(
            height: 15,
          ),
          signUpWith(),
        ],
      ),
    );
  }

  void showHidePassword() {
    print('_LoginScreenState.showHidePassword');
  }

  void signUpAction() {
    print('_LoginScreenState.signUpAction');
  }
}
