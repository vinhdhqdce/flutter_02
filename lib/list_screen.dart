import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List view demo"),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return Container(
      child: Column(
        children: [
          Expanded( //Xác định kích thước bao ngoài cho listview. tránh lỗi do listview không render hết phần tử ngay 1 lúc
            child: ListView( //List view chỉ render các phần tử được hiển thị và sắp hiển thị. Khi cuộn xuống sẽ reuse lại các phần tử trên, tránh tràn bộ nhớ (trừ ảnh được cache). Column sẽ render hết 1 lượt
            // shrinkWrap: true,//Bắt buộc listview render tất cả phần tử bên trong để có thể lồng được vào các listview khác, column, row... hoặc có thể dùng Expanded
            children: [
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
        ],
            ),
          ),]
      ),
    );
  }
}
