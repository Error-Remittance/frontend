import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectProcess.dart';
import 'package:frontend/mainView/confirmPattern.dart';

class SelectReturnRequestPage extends StatefulWidget {
  const SelectReturnRequestPage({Key? key}) : super(key: key);

  @override
  _SelectReturnRequestPageState createState() => _SelectReturnRequestPageState();
}

class _SelectReturnRequestPageState extends State<SelectReturnRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()  { return Future(() => true); },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "착오송금액 반환에 \n동의하시겠습니까?",
                style: TextStyle(
                  color: Color(0xff3E97F7),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "거부 시 예금보험공사에서 지급명령을 신청할 수 있고, \n"
                "착오송금액 무단 사용 시 횡령죄로 처벌받을 수 있습니다.",
                style: TextStyle(
                  color: Color(0xff808080),
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                        builder: (context) => ConfirmPattern(tag: 1,),
                      ),
                    );
                  },
                  icon: Image.asset('lib/assets/button_accept.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                        builder: (context) => SelectProcessPage(),
                      ),
                    );
                  },
                  icon: Image.asset('lib/assets/button_decline.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
