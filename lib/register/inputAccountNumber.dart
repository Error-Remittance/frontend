import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/checkPattern.dart';
import 'package:frontend/mainView/accountList.dart';
import 'package:frontend/register/inputAccountNumberCheck.dart';
import 'package:frontend/alertWindow.dart';

class InputAccountNumber extends StatefulWidget {
  final String text;
  final int tag;
  const InputAccountNumber({Key? key, required this.text, required this.tag}) : super(key: key);

  @override
  _InputAccountNumberState createState() => _InputAccountNumberState();
}

class _InputAccountNumberState extends State<InputAccountNumber> {

  final accountNumberController = TextEditingController();
  var alertMessage = '성함과 일치하는 계좌를 발견하게 못했어요!\n계좌번호를 제대로 입력했는지 확인해주세요.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              margin: const EdgeInsets.only(top: 10, bottom: 20, left: 25),
              child: Text(
                "${widget.text} 계좌번호를\n입력해주세요",
                style: const TextStyle(
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
                controller: accountNumberController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '계좌번호 입력',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  NoAnimationMaterialPageRoute(
                    builder: (context) => InputAccountNumberCheck(text: widget.text, tag: widget.tag, number: accountNumberController.text,),
                  ),
                );
              },
              icon: Image.asset('lib/assets/button_accept.png'),
              iconSize: 80,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
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