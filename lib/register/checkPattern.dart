import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/alertWindow.dart';
import 'package:frontend/register/patternLock/patternLock.dart';
import 'package:frontend/mainView/accountList.dart';

class CheckPattern extends StatefulWidget {
  const CheckPattern({Key? key}) : super(key: key);

  @override
  _CheckPatternState createState() => _CheckPatternState();
}

class _CheckPatternState extends State<CheckPattern> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<int>? pattern = ModalRoute.of(context)!.settings.arguments as List<int>?;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // Appbar 배경색
        elevation: 0.0, // Appbar 그림자
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 40, top:20, bottom: 20),
              child: const Text(
                "회원님 반갑습니다!\n로그인 해주세요",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "잠금 해제 패턴을 그리세요",
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "최소 4개 이상 선택",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff626262),
                  ),
                )
            ),
            Flexible(
              child: PatternLock(
                selectedColor: Colors.blue,
                pointRadius: 8.5,
                showInput: true,
                dimension: 3,
                relativePadding: 1,
                selectThreshold: 25,
                fillPoints: true,
                onInputComplete: (List<int> input) {
                  if (listEquals<int>(input, pattern)) {
                    Navigator.of(context).pop(true);
                  } else {
                    FlutterDialog("패턴이 일치하지 않습니다.\n다시 시도해주세요.");
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20,bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    NoAnimationMaterialPageRoute(
                      builder: (context) => const AccountListPage(),
                    ),
                  );
                },
                child: const Text(
                  '확인',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  animationDuration: const Duration(days: 10000),
                  splashFactory: NoSplash.splashFactory,
                  fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.85,
                      50
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: const Color(0xffD9D9D9),
                  // side: const BorderSide(width:1, color: Color(0xff8a9cb3)),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  // ignore: non_constant_identifier_names
  void FlutterDialog(String text) {
    showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertWindow(contents: text);
      }
    );
  }
}