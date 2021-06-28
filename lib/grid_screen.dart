import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid view demo"),
      ),
      body: buildGridView(),
    );
  }

  Widget buildGridView() {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 3/2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
    ),
        itemBuilder: (context, index) => buildItem(),
      itemCount: 17,

    );
  }

  buildItem() {
    return Container(
      color: Colors.blue,
    );
  }
}
