import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/mainView/accountList.dart';
import 'package:frontend/mainView/askReportReturnRequest.dart';

class SentReturnRequestListPage extends StatefulWidget {
  @override
  _SentReturnRequestListState createState() => _SentReturnRequestListState();
}

class _SentReturnRequestListState extends State<SentReturnRequestListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white, // Appbar 배경생
        elevation: 1, // Appbar 그림자
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRouteWithoutAnimation(
                builder: (context) =>
                    AccountListPage(
                      // userId: widget.userId,
                      // password: widget.password,
                      // name: widget.name,
                    ),
              ),
            );
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black87,
            size: 30,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          '보낸 요청 목록',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 30,
              ),
            ),
            Container(
              child: Expanded(
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  // color: Colors.white,
                  width: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 10, // 리스트 개수
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Theme(
                            data: theme,
                            child: ExpansionTile(
                              title: Container(
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '김도둑',
                                          style: TextStyle(
                                            color: Color(0xFFA7A7A7),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '1002-123-45678',
                                          style: TextStyle(
                                            color: Color(0xFF3A3A3A),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              children: [
                                Container(
                                  height: 50,
                                  color: Color(0xFFDEECFF),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '2022.02.05 토요일',
                                            style: TextStyle(
                                              color: Color(0xFFA7A7A7),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '10,000 원',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 33,
                                            width: 33,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRouteWithoutAnimation(
                                                    builder: (context) =>
                                                         AskReportReturnRequestPage(

                                                         ),
                                                  ),
                                                );
                                              },
                                              child:
                                              Image.asset(
                                                // 'lib/assets/icons/report_blue.png'
                                                'lib/assets/icons/report_red.png',
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                splashFactory: NoSplash.splashFactory,
                                                onPrimary: Colors.transparent,
                                                primary: Color(0xFFDEECFF),
                                                // shadowColor: Colors.transparent,
                                                padding: EdgeInsets.all(0.5),
                                                // onSurface: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            height: 1,
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
            Center(
              child: SizedBox(
                height: 20,
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
