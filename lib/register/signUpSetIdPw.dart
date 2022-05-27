import 'package:flutter/material.dart';
import 'package:frontend/register/agreementToTerms.dart';
import 'package:frontend/alertWindow.dart';


class SignUpSetIdPwPage extends StatefulWidget {
  const SignUpSetIdPwPage({Key? key}) : super(key: key);

  @override
  _SignUpSetIdPwPageState createState() => _SignUpSetIdPwPageState();
}

class _SignUpSetIdPwPageState extends State<SignUpSetIdPwPage> {
  final idController = TextEditingController();
  final pwController1 = TextEditingController();
  final pwController2 = TextEditingController();

  var alertMessage = [
    '중복된 아이디입니다.',
    '비밀번호를 정확하게 입력해주세요',
    '영문, 숫자를 포함한 8자를 입력헤주세요.'
  ];

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
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20,left: 40),
              alignment: Alignment.centerLeft,
              child: const Text(
                '아이디와 비밀번호를\n입력해주세요.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38)),
              ),
              child: TextField(
                controller: idController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '아이디',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38)),
              ),
              child: TextField(
                obscureText: true,
                controller: pwController1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '비밀번호(영문, 숫자 포함 8자 이상)',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38)),
              ),
              child: TextField(
                obscureText: true,
                controller: pwController2,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '비밀번호 확인',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: showAgreeModal,
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

  showAgreeModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AgreementToTermsModal();
            }
        );
      },
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
