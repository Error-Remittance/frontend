import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/register/patternLock/patternLock.dart';
import 'package:frontend/register/utils.dart';
import 'package:frontend/register/signUpIdentification.dart';

class SetPattern extends StatefulWidget {
  @override
  _SetPatternState createState() => _SetPatternState();
}

class _SetPatternState extends State<SetPattern> {
  bool isConfirm = false;
  List<int>? pattern;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white, // Appbar 배경색
        elevation: 0.0, // Appbar 그림자
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRouteWithoutAnimation(
                builder: (context) => SignUpIdentificationPage(

                ),
              ),
            );
          },
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 25,top:20, bottom: 20),
                child: Text(
                  isConfirm ? "까먹지 않게 한 번 더!\n다시 패턴을 그려주세요" : "좋아요!\n이제 패턴을 설정해볼까요?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "잠금 해제 패턴을 그리세요",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "최소 4개 이상 선택",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff626262),
                    ),
                  )
              ),
            ],
          ),
          Flexible(
            child: PatternLock(
              selectedColor: Colors.blue,
              pointRadius: 10,
              onInputComplete: (List<int> input) {
                if (input.length < 4) {
                  context.replaceSnackbar(
                    content: Text(
                      "최소 4개 이상 선택해 주세요!",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                  return;
                }
                if (isConfirm) {
                  if (listEquals<int>(input, pattern)) {
                    Navigator.of(context).pop(pattern);
                  } else {
                    context.replaceSnackbar(
                      content: Text(
                        "패턴이 일치하지 않습니다.",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                    setState(() {
                      pattern = null;
                      isConfirm = false;
                    });
                  }
                } else {
                  setState(() {
                    pattern = input;
                    isConfirm = true;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}