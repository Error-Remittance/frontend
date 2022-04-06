import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/register/signUpStart.dart';
import 'package:frontend/register/setPattern.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpIdentificationPage extends StatefulWidget {
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

  bool isChecked = false;

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
                MaterialPageRouteWithoutAnimation(
                  builder: (context) => SignUpStartPage(

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20,left: 40),
              alignment: Alignment.centerLeft,
              child: Text(
                '먼저, 본인 확인부터\n진행해볼게요!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38)),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '이름 입력',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8*0.45,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      controller: frontRRNController,
                      decoration: InputDecoration(
                        hintText: '주민번호 앞 6자리',
                        contentPadding: EdgeInsets.all(5),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8*0.1,
                    child: Text(
                      ' - ',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8*0.45,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      controller: backRRNController,
                      decoration: InputDecoration(
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
              decoration: BoxDecoration(
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "전화번호 입력",
                        contentPadding: EdgeInsets.all(5.0),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8*0.3,
                    height: 27,
                    child: ElevatedButton(
                      onPressed: () async {
                        // 인증 요청 로직
                      },
                      child: Text(
                        '인증 요청',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        splashFactory: NoSplash.splashFactory,
                        primary: Color(0xffe2dfdf),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: certificationNumberController,
                decoration: InputDecoration(
                  hintText: 'SMS 인증',
                  contentPadding: EdgeInsets.all(5),
                ),
              ),
            ),
            Spacer(),
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
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Container(
            padding: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Color(0xff8a93bc),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          '약관에 모두 동의',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      // 체크박스 들어갈 자리
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: IconButton(
                          icon: Icon(Icons.check_circle_outline),
                          onPressed: () {},
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.85,
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                ),
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "착송 필수 항목 모두 동의",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.chevron_right,
                                color: Color(0xff626262),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                ),
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "휴대폰/카드 본인확인 서비스",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.chevron_right,
                                color: Color(0xff626262),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                ),
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "문자/이메일 수신 동의",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.chevron_right,
                                color: Color(0xff626262),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                ),
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "맞춤형 광고 선택 동의",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.chevron_right,
                                color: Color(0xff626262),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                ),
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "마케팅 정보 수신 선택 동의",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.chevron_right,
                                color: Color(0xff626262),
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRouteWithoutAnimation(
                          builder: (context) => SetPattern(

                          ),
                        ),
                      );
                    },
                    child: Container(
                          child:Text(
                            '확인',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      animationDuration: Duration(days: 10000),
                      splashFactory: NoSplash.splashFactory,
                      fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.85,
                          50
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Color(0xffd9d9d9),
                      side: BorderSide(width:1, color: Color(0xff8a9cb3)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
