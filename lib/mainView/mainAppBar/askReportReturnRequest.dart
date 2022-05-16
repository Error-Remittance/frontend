import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/accountList.dart';
import 'package:frontend/mainView/mainAppBar/confirmReportReturnRequest.dart';

class AskReportReturnRequestPage extends StatefulWidget {
  const AskReportReturnRequestPage({Key? key}) : super(key: key);

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
              NoAnimationMaterialPageRoute(
                builder: (context) => const AccountListPage(),
              ),
            );
            return true;
          },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 200,
            ),
            const Text(
              '06.28(월) 김도둑님의\n착오 송금건을 신고합니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
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
            const SizedBox(
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
      NoAnimationMaterialPageRoute(
        builder: (context) => ConfirmReportReturnRequestPage(),
        ),
      );
  }
}
