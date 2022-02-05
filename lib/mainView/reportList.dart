import 'package:flutter/material.dart';
import 'package:frontend/mainView/accountList.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class ReportListPage extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportListPage> {
  @override
  void initState() {
    // _returnRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white, // Appbar 배경생
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: AccountListPage(
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
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            '신고건 목록',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.push(
              context,
              MaterialPageRouteWithoutAnimation(
                builder: (context) => AccountListPage(
                  // userId: widget.userId,
                  // password: widget.password,
                  // name: widget.name,
                ),
              ),
            );
            return true;
          },
          child: Column(
          children: <Widget>[
            SizedBox(
              height: 30, //ScreenUtil().setHeight(30)
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '6.28',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height*0.75,
                          child: VerticalDivider(
                            color: Colors.grey,
                            width: 5,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Center(
                          child: Container(
                            width: 260,
                            height: 80,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                fixedSize: Size(
                                    260,
                                    80
                                ),
                                primary: Color(0xFFFF766D),
                              ),
                              onPressed: () {},
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0,10,0,10),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "김도둑",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '10,000 원',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "1002-123-45678",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '|   18시 30분',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
