import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/getAccount.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:app_settings/app_settings.dart';

class FingerPrintRegistrationModal extends StatefulWidget {
  const FingerPrintRegistrationModal({Key? key}) : super(key: key);

  @override
  _FingerPrintRegistrationModalState createState() => _FingerPrintRegistrationModalState();
}

class _FingerPrintRegistrationModalState extends State<FingerPrintRegistrationModal> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final String _signupText = "드디어 마지막 단계에요!\n계좌를 연결해 '착송'해주시면 됩니다";
  final int _signupTag = 0;

  bool _hasBioSensor = false;
  LocalAuthentication authentication = LocalAuthentication();

  Future<void> _checkBio() async {
    try {
      _hasBioSensor = await authentication.canCheckBiometrics;
      print(_hasBioSensor);
      if(_hasBioSensor) {
        _getAuth();
      }
    } on PlatformException catch (e) {
      print("_checkBio error : ${e}");
      return;
    }
  }

  Future<void> _getAuth() async {
    bool isAuth = false;
    try {
      isAuth = await authentication.authenticate(
        localizedReason: "Scan your fingerprint to authenticate",
        biometricOnly: true,
        stickyAuth: true,
        useErrorDialogs: true,
      );
      print(isAuth);
      if(isAuth) {
        // Navigation
        Navigator.push(
          context,
          NoAnimationMaterialPageRoute(
              builder: (context) => GetAccount(text: _signupText, tag: _signupTag)
          ),
        );
      }
    } on PlatformException catch (e) {
      print("_getAuth error : ${e}");
      // 등록된 지문이 없을 때
      ConfrimDialog(context);
      return;
    }
  }

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
                    side: const BorderSide(width:1, color: Color(0xff64ACF9)),
                  ),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    // 지문 인증
                    _checkBio();
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
                    side: const BorderSide(width:1, color: Color(0xffD9D9D9)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
              children: <Widget>[
                Center(
                  child: Column(
                    children: const [
                      Text("등록된 지문이 없습니다!"),
                      Text("지문 등록으로 이동합니다."),
                    ],
                  )
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
                      },
                      child: const Text('아니요')
                  ),
                  const SizedBox(width: 50,),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        AppSettings.openSecuritySettings();
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