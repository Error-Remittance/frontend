import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/localAuth/fingerPrint.dart';
import 'package:frontend/register/getAccount.dart';

class FingerPrintRegistrationModal extends StatefulWidget {
  const FingerPrintRegistrationModal({Key? key}) : super(key: key);

  @override
  _FingerPrintRegistrationModalState createState() => _FingerPrintRegistrationModalState();
}

class _FingerPrintRegistrationModalState extends State<FingerPrintRegistrationModal> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String _signupText = "드디어 마지막 단계에요!\n계좌를 연결해 '착송'해주시면 됩니다";
  int _signupTag = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.6,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "혹시 지문이 편하신가요?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, left: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "지문 인증만 하시면 돼요!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            child: const Image(
              width: 200,
              height: 200,
              image: AssetImage('lib/assets/finger_print.png'),
            ),
          ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                          builder: (context) => GetAccount(text: _signupText, tag: _signupTag)
                      ),
                    );
                  },
                  child: const Text(
                    '나중에',
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
                        MediaQuery.of(context).size.width * 0.4,
                        50
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: const Color(0xff64ACF9),
                    side: const BorderSide(width:1, color: Color(0xff8a9cb3)),
                  ),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                          builder: (context) => FingerPrint()
                      ),
                    );
                  },
                  child: const Text(
                    '지문 인증',
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
                        MediaQuery.of(context).size.width * 0.4,
                        50
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: const Color(0xffD9D9D9),
                    side: const BorderSide(width:1, color: Color(0xff8a9cb3)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}