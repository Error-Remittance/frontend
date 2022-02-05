import 'package:flutter/material.dart';
import 'package:frontend/mainView/sentReturnRequestList.dart';
import 'package:frontend/mainView/reportList.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class AccountListPage extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountListPage> {

  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
          backgroundColor: Colors.white, // Appbar 배경색
          elevation: 1, // Appbar 그림자
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ]
      ),
      endDrawer: Container(
        width: 210, //ScreenUtil().setWidth(210)
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 50,
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(''),
                ),
              ),
              ExpansionTile(
                title: new Text(
                  "반환 현황",
                  style: TextStyle(
                      fontSize: 16, //ScreenUtil().setSp(16)
                      fontWeight: FontWeight.w500),
                ),
                children: [
                  Divider(height: 3),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRouteWithoutAnimation(
                          builder: (context) => SentReturnRequestListPage(
                          //   userId: widget.userId,
                          //   password: widget.password,
                          //   name: widget.name,
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black87,
                    ),
                    child: Row(
                      children: [
                        Text("   보낸 요청 목록"),
                        Spacer(),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRouteWithoutAnimation(
                          // builder: (context) => ReceivedReturnRequestListPage(
                          //   userId: widget.userId,
                          //   password: widget.password,
                          //   name: widget.name,
                          // ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.black87,
                    ),
                    child: Row(
                      children: [
                        Text("   받은 요청 목록"),
                        Spacer(),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: new Text(
                  "신고건 목록",
                  style: TextStyle(
                      fontSize: 16, //ScreenUtil().setSp(16)
                      fontWeight: FontWeight.w500),
                ),
                children: [],
                trailing: Icon(Icons.chevron_right),
                onExpansionChanged: (bool isExpanded) {
                  Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ReportListPage(
                    //   userId: widget.userId,
                    //   password: widget.password,
                    //   name: widget.name,
                        ),
                      ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () { return Future(() => false); },
          child: Column(
          children: <Widget>[
            SizedBox(
              height: 30, //ScreenUtil().setHeight(30)
            ),
            Center(
              child: Container(
                width: 290, //ScreenUtil().setWidth(290)
                height: 35, //ScreenUtil().setHeight(35)
                child: Text(
                  "김철수님",
                  style: TextStyle(
                      fontSize: 20, //ScreenUtil().setSp(20)
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 295, //ScreenUtil().setWidth(290)
                height: 1, //ScreenUtil().setHeight(1)
                child: Divider(
                  thickness: 1.2,
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(

                    ),
                  );
                },
                child: Column(
                   children: [
                     SizedBox(
                       height: 12,
                     ),
                     Container(
                       alignment: Alignment.centerLeft,
                       child: Text(
                         "SOL 통장",
                         style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.w600,
                         )
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Container(
                       alignment: Alignment.centerLeft,
                       child: Text(
                           "1002-123-456789",
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.w400,
                           )
                       ),
                     ),
                     Spacer(),
                     Container(
                       alignment: Alignment.centerRight,
                       child: Text(
                         '100,000'+'원',
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 10,
                     ),
                   ],
                ),
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                animationDuration: Duration(days: 10000),
                fixedSize: Size(
                  295, 130,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Color(0xFF1690F0),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 275,
              child: Container(
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  width: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int indedx) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRouteWithoutAnimation(

                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    child: Image.asset(
                                      'lib/assets/shinhanbank_logo.png',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '쏠편한 입출금 통장',
                                        style: TextStyle(
                                          color: Color(0xFFA7A7A7),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '510,000',
                                        style: TextStyle(
                                          color: Color(0xFF3A3A3A),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFF3A3A3A),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.fromLTRB(
                                    14,
                                    10,
                                    14,
                                    10,
                                ),
                                fixedSize: Size(
                                  300, 60,
                                ),
                                primary: Colors.white, // background
                              ),
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 0.8,
                            indent: 15,
                            endIndent: 15,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Color(0xFF717171),
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                animationDuration: Duration(days: 10000),
                fixedSize: Size(
                    280, 33
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Color(0xFFFAFAFA),
              ),
            ),
            Container(
              width: 280,
              child: Divider(
                height: 25,
                thickness: 1.3,
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/chatbot_icon.png',
                      fit: BoxFit.contain,
                      height: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '챗봇 상담',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              style: ElevatedButton.styleFrom(
                animationDuration: Duration(days: 10000),
                splashFactory: NoSplash.splashFactory,
                fixedSize: Size(
                    280, 40
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Color(0xFF1690F0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
