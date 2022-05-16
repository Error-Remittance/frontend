import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/accountList.dart';

class SelectAskReturnConfirmPage extends StatelessWidget {
  const SelectAskReturnConfirmPage({Key? key}) : super(key: key);

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
        onWillPop: () async {return true;},
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 200,
            ),
            const Text(
              '오송금액에 대하여\n반환 요청을 완료하셨습니다.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "수취인이 반환하면 '착송'의 이름으로\n"
                  "수수료가 차감된 금액만큼 해당 계좌로 금액을 송금합니다.",
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
