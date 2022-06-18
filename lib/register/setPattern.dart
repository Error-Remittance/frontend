import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/alertWindow.dart';
import 'package:frontend/register/patternLock/patternLock.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:frontend/register/fingerPrintRegistration.dart';
import 'package:frontend/register/getAccount.dart';

class SetPattern extends StatefulWidget {
  const SetPattern({Key? key}) : super(key: key);

  @override
  _SetPatternState createState() => _SetPatternState();
}

class _SetPatternState extends State<SetPattern> {

  // Widget _to = const AccountListPage();
  bool _isButtonDisabled = true;
  bool isConfirm = false;
  List<int>? pattern;

  final String _signupText = "드디어 마지막 단계에요!\n계좌를 연결해 '착송'해주시면 됩니다";
  final int _signupTag = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: scaffoldKey,
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
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 25,top:20, bottom: 20),
                  child: Text(
                    isConfirm ? "까먹지 않게 한 번 더!\n다시 패턴을 그려주세요" : "좋아요!\n이제 패턴을 설정해볼까요?",
                    style: const TextStyle(
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
              ],
            ),
            Flexible(
              child: PatternLock(
                selectedColor: Colors.blue,
                pointRadius: 10,
                onInputComplete: (List<int> input) {
                  if (!isConfirm && input.length < 4) {
                    FlutterDialog("최소 4개 이상 선택해주세요!");
                    print('under 4 parttern');
                    return;
                  }
                  if (isConfirm) {
                    if (listEquals<int>(input, pattern)) {
                      // Navigator.of(context).pop(pattern);
                      setState(() {
                        _isButtonDisabled = false;
                        if (kDebugMode) {
                          print('button available');
                        }
                      });
                    } else {
                      FlutterDialog("패턴이 일치하지 않습니다.\n다시 설정해주세요.");
                      print('parttern dismatch');
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
            Container(
              margin: const EdgeInsets.only(top: 20,bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  _isButtonDisabled ? null :
                  ConfrimDialog(context);
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
                  primary: _isButtonDisabled ? const Color(0xffD9D9D9) : const Color(0xff64ACF9),
                  side: BorderSide(width:1, color: _isButtonDisabled ? const Color(0xffD9D9D9) : const Color(0xff64ACF9)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget BottomModal() {
    return FingerPrintRegistrationModal();
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

  void ConfrimDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: const <Widget>[
                Text("알림창"),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Center(
                  child: Text(
                    '지문 인증을 하시겠습니까?',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          NoAnimationMaterialPageRoute(
                              builder: (context) => GetAccount(text: _signupText, tag: _signupTag)
                          ),
                        );
                      },
                      child: const Text('아니요')
                  ),
                  const SizedBox(width: 50,),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => BottomModal(),
                        );
                      },
                      child: const Text('네')
                  ),
                ],
              ),
            ],
          );
        });
  }
}
