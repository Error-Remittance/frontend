import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/checkPattern.dart';
import 'package:frontend/mainView/accountList.dart';
import 'package:frontend/alertWindow.dart';

class InputAccountNumberCheck extends StatefulWidget {
  final String text;
  final int tag;
  final String number;
  const InputAccountNumberCheck({Key? key, required this.text, required this.tag, required this.number}) : super(key: key);

  @override
  _InputAccountNumberCheckState createState() => _InputAccountNumberCheckState();
}

class _InputAccountNumberCheckState extends State<InputAccountNumberCheck> {

  final accountNumberController = TextEditingController();
  final accountGetTextController = TextEditingController();
  var alertMessage = '일치하지 않습니다.\n단어를 제대로 기입했는지 확인해주세요.';
  bool widgetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 25),
              child: Text(
                "${widget.text} 계좌번호를\n입력해주세요",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38)),
              ),
              child: TextField(
                controller: accountNumberController,
                enabled: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.number,
                  contentPadding: const EdgeInsets.all(5),
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 25),
              child: const Text(
                "김신한님의 계좌를 찾았어요!\n계좌로 송금된 단어를 적어주세요",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38)),
              ),
              child: TextField(
                controller: accountGetTextController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '단어 입력',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: !widgetVisible,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widgetVisible = true;
                  });
                },
                icon: Image.asset('lib/assets/button_accept.png'),
                iconSize: 80,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ),
            Visibility(
              visible: widgetVisible,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.15,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 10, bottom: 10, left: 25),
                    child: const Text(
                      "회원가입하신다고 고생하셨어요\n"
                      "앞으로 착오송금 문제는\n"
                      "저희 '착송' 어플로 해결해봐요!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              )
            ),
            Visibility(
              visible: widgetVisible,
              child: Container(
                margin: const EdgeInsets.only(top: 10,bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                        builder: (context) => widget.tag == 0 ? CheckPattern() : AccountListPage(),
                      ),
                    );
                  },
                  child: const Text(
                    '좋아요!',
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
                    primary: const Color(0xff64ACF9),
                    // side: const BorderSide(width:1, color: Color(0xff8a9cb3)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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