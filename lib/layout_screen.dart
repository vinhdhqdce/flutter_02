import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  final String title;

  const LayoutScreen({Key? key, required this.title}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Text1'),
          Text('Text2'),
          blueBox(),
          Text('Text3'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              blueBox(),
              // Expanded(child: blueBox()),
              blueBox(),
              blueBox(),
              ],
          ),
          Row(
            children: [
              //Expanded: Còn khoảng không thì sẽ chiếm hết
              // Expanded(child: Text("CA BỆNH BN13550-BN13551, BN13553 tại tỉnh Vĩnh Long. Ngày 20/6, các bệnh nhân từ Indonesia nhập cảnh sân bay Cần Thơ trên chuyến bay VJ2561 và được cách ly ngay sau khi nhập cảnh tại tỉnh Vĩnh Long. Kết quả xét nghiệm lần thứ nhất ngày 21/6 dương tính với SARS-CoV-2. ")),
              //F lexible: đến giới hạn thì sẽ xuống dòng
              Flexible(child: Text("CA BỆNH BN13550-BN13551, BN13553 tại tỉnh Vĩnh Long. Ngày 20/6, các bệnh nhân từ Indonesia nhập cảnh sân bay Cần Thơ trên chuyến bay VJ2561 và được cách ly ngay sau khi nhập cảnh tại tỉnh Vĩnh Long. Kết quả xét nghiệm lần thứ nhất ngày 21/6 dương tính với SARS-CoV-2. "))
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('Vi du expanded:'),),
              Icon(Icons.info),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          Row(
            children: [
              Expanded(child: blueBox(),flex: 1,),
              Expanded(child: redBox(),flex: 2,),
            ],
          ),
        ],
      ),
    );
  }

  Widget blueBox() {
    return Container(
      color: Colors.blue,
      width: 100,
      height: 100,
    );
  }

  Widget redBox() {
    return Container(
      color: Colors.red,
      width: 100,
      height: 100,
    );
  }
}
