import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/signUpIdentification.dart';

class SignUpSelectBtn extends StatefulWidget {
  const SignUpSelectBtn({Key? key}) : super(key: key);

  @override
  _SignUpSelectBtnState createState() => _SignUpSelectBtnState();
}

class _SignUpSelectBtnState extends State<SignUpSelectBtn> {

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
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20,left: 40),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '안녕하세요!\n어떤 용건으로 오셨나요?',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        NoAnimationMaterialPageRoute(
                          builder: (context) => const SignUpIdentificationPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '네, 반환을 요청하러 왔어요!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right, color: Colors.black,),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      animationDuration: const Duration(days: 10000),
                      splashFactory: NoSplash.splashFactory,
                      fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.85,
                          63
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.white,
                      side: const BorderSide(width:1, color: Color(0xff000000)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      // 다른 페이지
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '아니요, 반환을 수락하러 왔어요!',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right, color: Colors.black,),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      animationDuration: const Duration(days: 10000),
                      splashFactory: NoSplash.splashFactory,
                      fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.85,
                          63
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.white,
                      side: const BorderSide(width:1, color: Color(0xff000000)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        NoAnimationMaterialPageRoute(
                          builder: (context) => const SignUpIdentificationPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '착송 유저가 되고싶어요:)',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right, color: Colors.black,),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      animationDuration: const Duration(days: 10000),
                      splashFactory: NoSplash.splashFactory,
                      fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.85,
                          63
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: Colors.white,
                      side: const BorderSide(width:1, color: Color(0xff000000)),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}