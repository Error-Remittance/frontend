import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:frontend/mainView/mainAppBar/sentReturnRequestList.dart';
import 'package:frontend/mainView/mainAppBar/reportList.dart';
import 'package:frontend/mainView/mainAppBar/receiveReturnRequestList.dart';

class AppBarDrawerPage extends StatefulWidget {
  const AppBarDrawerPage({Key? key}) : super(key: key);

  @override
  _AppBarDrawerPageState createState() => _AppBarDrawerPageState();
}

class _AppBarDrawerPageState extends State<AppBarDrawerPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6, //ScreenUtil().setWidth(210)
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: const Text(
                      "반환 현황",
                      style: TextStyle(
                          fontSize: 16, //ScreenUtil().setSp(16)
                          fontWeight: FontWeight.w500),
                    ),
                    children: [
                      // const Divider(height: 3),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            NoAnimationMaterialPageRoute(
                              builder: (context) => SentReturnRequestListPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black87,
                        ),
                        child: Row(
                          children: const [
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
                            NoAnimationMaterialPageRoute(
                              builder: (context) => ReceiveReturnRequestListPage(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.black87,
                        ),
                        child: Row(
                          children: const [
                            Text("   받은 요청 목록"),
                            Spacer(),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: ExpansionTile(
                  title: const  Text(
                    "신고건 목록",
                    style: TextStyle(
                        fontSize: 16, //ScreenUtil().setSp(16)
                        fontWeight: FontWeight.w500),
                  ),
                  children: const [],
                  trailing: const Icon(Icons.chevron_right),
                  onExpansionChanged: (bool isExpanded) {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: ReportListPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}