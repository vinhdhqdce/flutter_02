import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          context: context,
          title: 'Hộp thư',
          isBack: false,
          elevation: 1,
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          backGroundColor: Colors.white),
      floatingActionButton: buildFloatingButton(
          'Tạo tin nhắn mới', Icon(Icons.add), newMessage,
          context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.grey[100],
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: ListView(
        children: [
          buildItem(
            title: 'Thông báo',
            message:
                'Cập nhật thông tin giao dịch, thajshjahs d ajkshdjahs djahsdjhasdh aksjdhh',
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            isUnread: true,
          ),
          buildItem(
            title: 'Khuyến mãi',
            message: 'Đừng bỏ lỡ ưu đãi siêu hấp dẫn từ VinID, Đừng bỏ lỡ ưu đãi siêu hấp dẫn từ VinID',
            icon: Icon(
              Icons.card_giftcard,
              color: Colors.white,
            ),
            backgroundIconColor: Colors.green,
            isUnread: false,
          ),
          buildItem(
            title: 'Tin tức',
            message: 'Cập nhật các tính năng mới nhất của VinID',
            icon: Icon(
              Icons.campaign_outlined,
              color: Colors.white,
            ),
            backgroundIconColor: Colors.blueAccent,
            isUnread: false,
          ),
        ],
      ),
      /*child: ListView.builder(
        itemBuilder: (ctx, index) {
          return buildItem();
        },
        itemCount: 5,
        physics: BouncingScrollPhysics(),
      ),*/
    );
  }

  Widget buildItem({
    required String message,
    required String title,
    Icon? icon,
    Color? backgroundIconColor,
    required bool isUnread,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: 40,
            height: 40,
            child: icon ??
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
            decoration: BoxDecoration(
                color: backgroundIconColor ?? Colors.red,
                borderRadius: BorderRadius.circular(20)),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      title,
                          style: TextStyle(
                            color: isUnread ? Colors.black : Colors.grey[600],
                            fontWeight:
                            isUnread ? FontWeight.bold : FontWeight.normal,
                          ),
                    )),
                    Text(
                      '27/04/2021',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isUnread ? Colors.black : Colors.grey[600],
                          fontWeight:
                              isUnread ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    isUnread
                        ? Container(
                            margin: const EdgeInsets.only(left: 40),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(4)),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void newMessage() {
    print('_LoginScreenState.signUpAction');
  }
}
