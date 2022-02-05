import 'package:flutter/material.dart';
import 'package:frontend/mainView/accountList.dart';
import 'package:frontend/mainView/confirmReportReturnRequest.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskReportReturnRequestPage extends StatefulWidget {
  @override
  _AskReportReturnRequestState createState() => _AskReportReturnRequestState();
}

class _AskReportReturnRequestState extends State<AskReportReturnRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.push(
              context,
              MaterialPageRouteWithoutAnimation(
                builder: (context) => AccountListPage(
                  // userId: widget.userId,
                  // password: widget.userPassword,
                  // name: widget.userName,
                ),
              ),
            );
            return true;
          },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Text(
              '06.28(월) 김도둑님의\n착오 송금건을 신고합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _reportReturnRequest();
                    },
                    icon: Image.asset('lib/assets/button_accept.png'),
                    iconSize: 80,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset('lib/assets/button_decline.png'),
                    iconSize: 80,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _reportReturnRequest() async {
    Navigator.push(
      context,
      MaterialPageRouteWithoutAnimation(
        builder: (context) => ConfirmReportReturnRequestPage(
            // userId: widget.userId,
            // userPassword: widget.userPassword,
            // userName: widget.userName
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
