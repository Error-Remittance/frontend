import 'package:flutter/material.dart';
import 'package:frontend/register/signUpStart.dart';
import 'package:frontend/register/setPattern.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            height: 60,
            child: Text(
              '먼저, 본인 확인부터\n진행해볼게요!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: '이름 입력',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 138,
                child: TextField(
                  controller: frontRRNController,
                  decoration: InputDecoration(
                    hintText: '주민번호 앞 6자리',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
              Container(
                width: 24,
                child: Text(
                  ' - ',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                width: 138,
                child: TextField(
                  controller: backRRNController,
                  decoration: InputDecoration(
                    hintText: '뒤 7자리',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                  obscureText: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: TextFormField(
                  // enabled: false,
                  controller: phoneNumberController1,
                  decoration: InputDecoration(
                    hintText: "전화번호 입력",
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 90,
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
                    splashFactory: NoSplash.splashFactory,
                    primary: Color(0xffe2dfdf),
                    // side: BorderSide(width: 0, color: Colors.white38),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 290,
                child: TextField(
                  controller: certificationNumberController,
                  decoration: InputDecoration(
                    hintText: 'SMS 인증',
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
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
    );
  }

  showAgreeModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 320,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Color(0xff8a93bc),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width:20, height:20),
                        Text(
                          '약관에 모두 동의',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Center(
                  child:SizedBox(
                      width: 350,
                      height: (55 * 5).toDouble(),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none, alignment: Alignment(0, 0),
                            children: <Widget>[
                              Positioned(
                                child: ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        "착송 필수 항목 모두 동의",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      trailing: Icon(
                                        Icons.chevron_right,
                                        color: Color(0xff626262),
                                      ),
                                      onTap: () {},
                                      leading: Radio(
                                        value: 1,
                                        groupValue: -1,
                                        onChanged: (value) {
                                          setState(() {
                                            // val = value;
                                          });
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "휴대폰/카드 본인확인 서비스",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      trailing: Icon(
                                        Icons.chevron_right,
                                        color: Color(0xff626262),
                                      ),
                                      onTap: () {},
                                      leading: Radio(
                                        value: 2,
                                        groupValue: -1,
                                        onChanged: (value) {
                                          setState(() {
                                            // val = value;
                                          });
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "문자/이메일 수신 동의",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      trailing: Icon(
                                        Icons.chevron_right,
                                        color: Color(0xff626262),
                                      ),
                                      onTap: () {},
                                      leading: Radio(
                                        value: 3,
                                        groupValue: -1,
                                        onChanged: (value) {
                                          setState(() {
                                            // val = value;
                                          });
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "맞춤형 광고 선택 동의",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      trailing: Icon(
                                        Icons.chevron_right,
                                        color: Color(0xff626262),
                                      ),
                                      onTap: () {},
                                      leading: Radio(
                                        value: 4,
                                        groupValue: -1,
                                        onChanged: (value) {
                                          setState(() {
                                            // val = value;
                                          });
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "마케팅 정보 수신 동의",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      trailing: Icon(
                                        Icons.chevron_right,
                                        color: Color(0xff626262),
                                      ),
                                      onTap: () {},
                                      leading: Radio(
                                        value: 5,
                                        groupValue: -1,
                                        onChanged: (value) {
                                          setState(() {
                                            // val = value;
                                          });
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                      ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRouteWithoutAnimation(
                          builder: (context) => SetPattern(
                          //   userId: widget.userId,
                          //   password: widget.password,
                          //   name: widget.name,
                          ),
                        ),
                      );
                    },
                    child: Center(
                          child:Text(
                            '확인',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                    style: ElevatedButton.styleFrom(
                      animationDuration: Duration(days: 10000),
                      splashFactory: NoSplash.splashFactory,
                      fixedSize: Size(
                          320, 40
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
