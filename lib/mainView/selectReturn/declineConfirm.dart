import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/accountList.dart';

class DeclineConfirm extends StatelessWidget {
  const DeclineConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {return true;},
        child: Column(
          children: <Widget>[
            const Spacer(),
            const Text(
              "반환 요청을\n거절하셨습니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700
              ),
            ),
            const Spacer(),
            Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    NoAnimationMaterialPageRoute(
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