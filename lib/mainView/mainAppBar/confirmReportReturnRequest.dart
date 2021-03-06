import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/mainAppBar/sentReturnRequestList.dart';


class ConfirmReportReturnRequestPage extends StatelessWidget {
  const ConfirmReportReturnRequestPage({Key? key}) : super(key: key);

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
                builder: (context) => SentReturnRequestListPage(),
              ),
            );
            return true;
          },
          child: Column(
          children: <Widget>[
            const SizedBox(
              height: 200,
            ),
            const Text(
              '신고하셨습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    NoAnimationMaterialPageRoute(
                      builder: (context) => SentReturnRequestListPage(),
                    ),
                  );
                },
                icon: Image.asset('lib/assets/button_accept.png'),
                iconSize: 80,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
