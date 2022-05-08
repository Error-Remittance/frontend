import 'package:flutter/material.dart';
import 'package:frontend/register/signUpIdentification.dart';
import 'package:frontend/register/setPattern.dart';


class SignUpSetIdPwPage extends StatefulWidget {
  const SignUpSetIdPwPage({Key? key}) : super(key: key);

  @override
  _SignUpSetIdPwPageState createState() => _SignUpSetIdPwPageState();
}

class _SignUpSetIdPwPageState extends State<SignUpSetIdPwPage> {
  final idController = TextEditingController();
  final pwController1 = TextEditingController();
  final pwController2 = TextEditingController();

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRouteWithoutAnimation(
                    builder: (context) => const SetPattern(

                    ),
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
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
