import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/mainView/sentReturnRequestList.dart';


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
              MaterialPageRouteWithoutAnimation(
                builder: (context) => SentReturnRequestListPage(
                  // userId: userId,
                  // password: userPassword,
                  // name: userName),
                ),
              ),
            );
            return true;
          },
          child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Text(
              '신고하셨습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => SentReturnRequestListPage(
                          // userId: userId,
                          // password: userPassword,
                          // name: userName
                      ),
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

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
