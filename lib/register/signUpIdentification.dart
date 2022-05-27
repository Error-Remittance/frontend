import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/signUpStart.dart';
import 'package:frontend/alertWindow.dart';
import 'package:frontend/register/signUpSetIdPw.dart';

class SignUpIdentificationPage extends StatefulWidget {
  const SignUpIdentificationPage({Key? key}) : super(key: key);

  @override
  _SignUpIdentificationState createState() => _SignUpIdentificationState();
}

class _SignUpIdentificationState extends State<SignUpIdentificationPage> {
  final nameController = TextEditingController();
  final frontRRNController = TextEditingController();
  final backRRNController = TextEditingController();
  final phoneNumberController1 = TextEditingController();
  final phoneNumberController2 = TextEditingController();
  final phoneNumberController3 = TextEditingController();
  final certificationNumberController = TextEditingController();
  bool isSMSRequested = false;
  bool isAuthenticated = false;
  String authMessage = "인증 요청을 해주세요.";
  late String verificationId;

  var alertMessage = [
    '본인 확인란에 내용을 전부 입력해주세요!',
    '한글 이외의 문자는 입력할 수 없습니다.',
    '인증 번호가 틀렸습니다.',
    '확인 버튼을 누르세요.'
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
              Navigator.push(
                context,
                NoAnimationMaterialPageRoute(
                  builder: (context) => const SignUpStartPage(),
                ),
              );
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
                '먼저, 본인 확인부터\n진행해볼게요!',
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
                controller: nameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '이름 입력',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8*0.45,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      controller: frontRRNController,
                      decoration: const InputDecoration(
                        hintText: '주민번호 앞 6자리',
                        contentPadding: EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8*0.1,
                    child: const Text(
                      ' - ',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8*0.45,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      controller: backRRNController,
                      decoration: const InputDecoration(
                        hintText: '뒤 7자리',
                        contentPadding: EdgeInsets.all(5),
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width * 0.8*0.7,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      controller: phoneNumberController1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "전화번호 입력",
                        contentPadding: EdgeInsets.all(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8*0.3,
                    height: 27,
                    child: ElevatedButton(
                      onPressed: () async {
                        // 인증 요청 로직
                      },
                      child: const Text(
                        '인증 요청',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        splashFactory: NoSplash.splashFactory,
                        primary: const Color(0xffe2dfdf),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: certificationNumberController,
                decoration: const InputDecoration(
                  hintText: 'SMS 인증',
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
                    builder: (context) => const SignUpSetIdPwPage(),
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

