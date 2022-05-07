import 'package:flutter/material.dart';
import 'package:frontend/mainView/accountList.dart';

class SelectReturnConfirmPage extends StatelessWidget {
  const SelectReturnConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {return true;},
        child: Column(
          children: <Widget>[
            const Spacer(),
            const Text(
              "반환 요청을 수락하셨습니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "이체 시 발생하는 수수료는 반환을 요청한 송금인이 부담합니다",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff808080),
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Spacer(),
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRouteWithoutAnimation(
                      builder: (context) => AccountListPage(),
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
