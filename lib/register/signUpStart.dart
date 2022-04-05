import 'package:flutter/material.dart';
import 'package:frontend/register/signUpIdentification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpStartPage extends StatefulWidget {
  @override
  _SignUpStartState createState() => _SignUpStartState();
}

class _SignUpStartState extends State<SignUpStartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xff8a93bc)),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(), // 이미지 들어갈 자리
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        alignment: Alignment.centerLeft,
                        child: Text("어서오세요 고객님!\n\n착오송금 문제를 해결하려\n여기까지 오셨다고요?\n\n이제 간편한 방식으로\n돈을 돌려받고, 반환해주세요."),
                      ),
                    ],
                  )
              ),
              Expanded(
                child: SizedBox(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRouteWithoutAnimation(
                        builder: (context) => SignUpIdentificationPage(

                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/assets/icons/person_outline.png',
                        fit: BoxFit.contain,
                        height: 16,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '    회원가입',
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
                    animationDuration: Duration(days: 10000),
                    splashFactory: NoSplash.splashFactory,
                    fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.85,
                        63
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Colors.white,
                    side: BorderSide(width:1, color: Color(0xff8a93bc)),
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

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
