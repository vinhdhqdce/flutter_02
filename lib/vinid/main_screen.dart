import 'dart:html';

import 'package:demo_vin_id/components.dart';
import 'package:flutter/material.dart';

import '../Utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // Sự kiện click ra ngoài thì ẩn bàn phím
        hideKeyboard();
      },
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.pink.shade100,
            // borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.pink.shade100,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            )),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              buildSearchBox(),
              SizedBox(
                height: 16,
              ),
              buildAd(),
              buildProfile(),
              SizedBox(
                height: 16,
              ),
              buildServices(),
              SizedBox(
                height: 16,
              ),
              buildViewAllServices(),
              SizedBox(
                height: 16,
              ),
              buildHeaderAdGrid(),
              SizedBox(
                height: 16,
              ),
              buildGridAd(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBox() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: inputTextField(
              context: context,
              keyboardType: TextInputType.text,
              hintText: 'Bạn đang muốn tìm',
              prefixIcon: Icons.search,
              inputBorder: Color(0xFFEEEEEE),
              radiusBox: 25,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Icon(Icons.card_giftcard),
          ),
        ],
      ),
    );
  }

  Widget buildAd() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.topCenter,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Tự tin là chính mình - VinID yêu bạn\n\n',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: 'Khám phá ngay',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold)),
                ], style: TextStyle(height: 1.5)),
              ),
            ),
          ),
          Image.asset(
            'assets/img_rocket.png',
            width: 180,
          ),
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      child: Row(
        children: [
          buildProfileItems(
              title: 'Điểm tích lũy',
              value: '1,346',
              icon: Icon(Icons.check_circle_outline, color: Colors.blue)),
          SizedBox(
            width: 8,
          ),
          buildProfileItems(
              title: 'Ví của tôi',
              value: '534,000đ',
              icon: Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }

  buildProfileItems(
      {required String title, required String value, required Icon icon}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: title + '\n',
                        style:
                            TextStyle(color: Colors.grey.shade500, height: 1.5),
                      ),
                      TextSpan(
                        text: value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServices() {
    final listServices = [
      ['Voucher', 'ic_service_voucher.png'],
      ['Vinhomes', 'ic_service_my_house.png'],
      ['Săn thưởng', 'ic_service_game.png'],
      ['Tiện ích', 'ic_service_utility_payment.png'],
      ['VinMart', 'ic_function_vinmart.png'],
      ['Đi chợ', 'ic_function_maket.png'],
      ['Cộng đồng', 'ic_function_food.png'],
      ['Techcombank Rewards', 'ic_function_tech.png'],
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 3 / 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) =>
          buildServiceItemFromList(listServices: listServices, index: index),
      itemCount: 8,
      shrinkWrap: true,
    );
  }

  Widget buildServiceItemFromList({required listServices, required int index}) {
    var serviceConfig = listServices[index];
    return buildServiceItem(
        title: serviceConfig[0], imageAsset: serviceConfig[1]);
  }

  Widget buildServiceItem({required String imageAsset, required String title}) {
    return
        // Stack(
        //   children: [
        // Positioned(
        //   child:
        Container(
      child: Column(
        children: [
          Image.asset(
            'assets/' + imageAsset,
            height: 48,
            width: 48,
          ),
          SizedBox(
            height: 4,
          ),
          Container(
              child: Text(
            title,
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
    // ),
    /*Positioned(
        top: 0,
        right: 0,
        child: Image.asset(
          'assets/ic_function_hot.png',
          height: 8,
          width: 8,
        ),
      )*/
    // ]);
  }

  Widget buildViewAllServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Xem tất cả dịch vụ ",
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
        Container(
          child: Text(
            "Mới",
            style: TextStyle(color: Colors.white, fontSize: 8),
          ),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color(0xffdb2323),
            borderRadius: BorderRadius.circular(30),
          ),
        )
      ],
    );
  }

  Widget buildHeaderAdGrid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Đừng bỏ lỡ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }

  Widget buildGridAd() {
    final listAds = [
      [
        'banner_hotmenu.jpg',
        'Mở Techcombank - Nhận quà từ VinID',
        'join',
      ],
      [
        'banner_hotmenu.jpg',
        'Mua nhà với gói vay 100% giá trị căn hộ?',
        'discovery',
      ],
      [
        'banner_hotmenu.jpg',
        'Săn thưởng mỗi ngày, quà về đầy tay',
        'join',
      ],
      [
        'banner_hotmenu.jpg',
        'Một hành động nhỏ bằng triệu nụ cười vui',
        'join',
      ],
      [
        'banner_hotmenu.jpg',
        'Sale ào ào như mưa rào tháng 6',
        'view',
      ],
      [
        'banner_hotmenu.jpg',
        'Trời nắng hay trời mưa - Có VinID đưa tin',
        'view',
      ],
      [
        'banner_hotmenu.jpg',
        'Nhập mã ONHANHE - Miễn phí giao hàng',
        'buy',
      ],
      [
        'banner_hotmenu.jpg',
        'Mở Techcombank - Nhận quà từ VinID',
        'join',
      ],
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) =>
          buildAdItemFromList(listAds: listAds, index: index),
      itemCount: 8,
      shrinkWrap: true,
    );
  }

  Widget buildAdItemFromList(
      {required List<List<String>> listAds, required int index}) {
    var adConfig = listAds[index];
    return buildAdItem(
      imageAsset: adConfig[0],
      content: adConfig[1],
      option: adConfig[2],
    );
  }

  Widget buildAdItem(
      {required String imageAsset,
      required String content,
      String option = 'view'}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                'assets/' + imageAsset,
                fit: BoxFit.cover,
              )),
          Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(content,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2))),
          buildOptional(option: option),
        ],
      ),
    );
  }

  Widget buildOptional({required String option}) {
    var body = [
      Icon(Icons.remove_red_eye, color: Colors.red, size: 14),
      SizedBox(width: 4),
      Text('Xem ngay',
          style: TextStyle(
              fontSize: 14,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500))
    ];
    switch (option) {
      case 'join':
        {
          body = [
            Icon(Icons.add_alarm_rounded, color: Colors.red, size: 14),
            SizedBox(width: 4),
            Text('Tham gia ngay',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500))
          ];
        }
        break;
      case 'discovery':
        {
          body = [
            Icon(Icons.stars_rounded, color: Colors.red, size: 14),
            SizedBox(width: 4),
            Text('Khám phá ngay',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500))
          ];
        }
        break;
      case 'view':
        {
          body = [
            Icon(Icons.remove_red_eye, color: Colors.red, size: 14),
            SizedBox(width: 4),
            Text('Xem ngay',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500))
          ];
        }
        break;
      case 'buy':
        {
          body = [
            Icon(Icons.shopping_cart, color: Colors.red, size: 14),
            SizedBox(width: 4),
            Text('Mua ngay',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500))
          ];
        }
        break;
      default:
        break;
    }

    return Container(
      padding: EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        children: body,
      ),
    );
  }
}