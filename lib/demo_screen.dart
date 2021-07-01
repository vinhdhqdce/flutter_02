import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Utils/Utils.dart';

class Demo2Screen extends StatefulWidget {
  final String title;

  const Demo2Screen({Key? key, required this.title}) : super(key: key);

  // const Demo2Screen({Key? key}) : super(key: key);

  @override
  _Demo2ScreenState createState() => _Demo2ScreenState();
}

class _Demo2ScreenState extends State<Demo2Screen> {
  final emailController = TextEditingController(); //Can dispose

  //Init chỉ chạy vào lần đầu tiên
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        //Can le giua app bar
        elevation: 1,
        // đổ bóng vạch ngăn giữa app bar và body
        leading: Icon(
          Icons.account_balance_wallet,
          size: 18,
          color: Colors.grey[600],
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Press icon notif");
              },
              icon: Icon(Icons.notifications)),
          IconButton(
              onPressed: () {
                print("Press icon call");
              },
              icon: Icon(Icons.call))
        ],
      ),
      //bao bang SafeArea de tranh tran ra notch
      body: GestureDetector(
        onTap: (){ // Sự kiện click ra ngoài thì ẩn bàn phím
          hideKeyboard();
        },
        child: Container(
          margin: EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          // width: MediaQuery.of(context).size.width,
          width: double.infinity,
          height: 300,
          // color: Colors.red, //có sử dụng decoration thì phải đưa vào trong
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.pink.shade50,
                  Colors.white,
                  Colors.yellow,
                  Colors.blue,
                ],
              )),

          // child: Text(widget.title),
          //Image ảnh tĩnh có trong app hoặc url. tuy nhiên không có cache do vậy thường dùng cho icon. còn ảnh sẽ sử dụng cái khác
          // child: Image.network(
          //   "https://icdn.dantri.com.vn/thumb_w/660/2021/06/03/xetnghiem24-crop-1622674863690.jpeg",
          //   fit: BoxFit.scaleDown,
          // ),

          // child: Image.asset("assets/img_rocket.png")

          //Button
/*        child: ElevatedButton(
            onPressed: () {
              print("Press button A");
            },
            child: Text("Button A"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFE724C)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                shadowColor: MaterialStateProperty.all<Color>(Color(0xFFFE724C)),
                elevation: MaterialStateProperty.all(5)
            ),
          )*/

          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  print("Press button A ${emailController.text})");
                },
                child: Text("Button A"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFE724C)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Color(0xFFFE724C)),
                    elevation: MaterialStateProperty.all(5)),
              ),

              Container(
                color: Colors.red,
                height: 66,
                child: TextField(
                  autocorrect: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'hint',
                    labelText: 'label'
                  ),
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  onChanged: (value){
                    print('Demo call back function $value');
                  },
                  controller: emailController, //get value

                ),
              ),
              //Inkwell or GestureDetector
              GestureDetector(
                onTap: (){
                  print('Tap on button B');
                },
                onDoubleTap: (){
                  print('Double tap on button B');
                },
                behavior: HitTestBehavior.translucent,//Cho phép click ra bên ngoài nếu không có màu
                child: Container(
                  // color: Colors.white,
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text('Button B'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        heroTag: 'cxzx',
        onPressed: () {},
        child: Icon(Icons.call),
      ),
    );
  }


}
