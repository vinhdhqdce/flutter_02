import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/components.dart';
import 'inbox_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final menus = [];

  @override
  void initState() {
    menus.addAll([
      [
        'Điểm tích luỹ',
        Icon(
          Icons.stars_rounded,
          color: Colors.red,
        ),
        Text('1,346 điểm'),
        false,
        true,
      ],
      [
        'Ví của tôi',
        Icon(
          Icons.account_balance_wallet,
          color: Colors.blueAccent,
        ),
        Text('534,000đ'),
        false,
        true,
      ],
      [
        'Quản lý chi tiêu',
        Icon(
          Icons.insights,
          color: Colors.blueAccent,
        ),
        Text('Xem luôn', style: TextStyle(color: Colors.lightBlue),),
        false,
        false,
      ],
      [
        'Túi đồ',
        Icon(
          Icons.shopping_bag,
          color: Colors.green,
        ),
        Container(),
        true,
        true,
      ],
      [
        'Sổ địa chỉ',
        Icon(
          Icons.location_on,
          color: Colors.blueAccent,
        ),
        Container(),
        false,
        true,
      ],
      [
        'Lịch sử giao dịch',
        Icon(
          Icons.notes,
          color: Colors.orangeAccent,
        ),
        Container(),
        false,
        true,
      ],
      [
        'Danh bạ',
        Icon(
          Icons.people,
          color: Colors.blueAccent,
        ),
        Container(),
        false,
        true,
      ],
      [
        'Quà tặng',
        Icon(
          Icons.card_giftcard,
          color: Colors.red,
        ),
        Container(),
        false,
        true,
      ],
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: InboxScreen(),
      appBar: AppBar(title: Text('Tài khoản')),
      /*appBar: buildAppBar(
          context: context,
          title: 'Tài khoản',
          isBack: false,
          elevation: 1,
          titleTextStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          backGroundColor: Colors.white),*/
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildProfile(),
            const SizedBox(height: 8),
            buildMenu(menus: menus),
            const SizedBox(height: 8),
            buildSetting(),
            const SizedBox(height: 8),
            buildHelp(),
            buildRating(),
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DAM HOANG QUANG VINH',
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 8),
                Text(
                  '0842 020 615',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              'Đã xác thực',
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }

  Widget buildRating() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Đánh giá của bạn\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  'Sẽ thật tuyệt vời nếu VinID nhận được đánh giá của bạn nhằm nâng cao chất lượng dịch vụ.',
                              style: TextStyle(color: Colors.grey[600])),
                        ], style: TextStyle(height: 1.5)),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/img_rocket.png',
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenu({required menus}) {
    return Container(
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          final menu = menus[index];
          return buildMenuItem(menuData: menu);
        },
        separatorBuilder: (ctx, index) => Container(
          color: Colors.white,
          child: Divider(height: 1, indent: 48),margin: EdgeInsets.only(right:16),
        ),
        itemCount: menus.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget buildSetting() {
    final settingData = [
      [
        'Cài đặt',
        Icon(
          Icons.settings,
          color: Colors.grey,
        ),
        Text('Mật khẩu & bảo mật', style: TextStyle(color: Colors.grey[400]),),
        false,
        true,
      ],
    ];
    return buildMenu(menus: settingData);
  }

  Widget buildHelp() {
    final helpData = [
      [
        'Trung tâm trợ giúp',
        Icon(
          Icons.headset_mic,
          color: Colors.grey,
        ),
        Container(),
        false,
        true,
      ],
      [
        'Giới thiệu bạn bè',
        Icon(
          Icons.share,
          color: Colors.grey,
        ),
        Container(),
        false,
        true,
      ],
    ];
    return buildMenu(menus: helpData);
  }

  Widget buildMenuItem({required menuData}) {
    return GestureDetector(
      onTap: () {
        print('_ProfileScreenState.buildMenuItem');
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              //Icons
              width: 32,
              child: menuData[1],
            ),
            Expanded(
              //Name menu
              child: Text(
                menuData[0],
                style: TextStyle(fontSize: 16),
              ),
            ),
            menuData[2],
            menuData[3] ? Container(
                    margin: const EdgeInsets.only(left: 40),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                  )
                : Container(),
            menuData[4] ? Icon(
              //Detail button
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.grey[500],
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
