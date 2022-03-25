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
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: () { return Future(() => false); },
        child: Column(
          children: <Widget>[
            Center(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 525,
              child: Container(
                width: 320,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xff8a93bc)),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 370, // 이미지가 들어갈 공간
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text("어서오세요 고객님!\n\n착오송금 문제를 해결하려\n여기까지 오셨다고요?\n\n이제 간편한 방식으로\n돈을 돌려받고, 반환해주세요.")
                      ],
                    )
                    ],
                )
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRouteWithoutAnimation(
                    builder: (context) => SignUpIdentificationPage(
                    //   userId: widget.userId,
                    //   password: widget.password,
                    //   name: widget.name,
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
                animationDuration: Duration(days: 10000),
                splashFactory: NoSplash.splashFactory,
                fixedSize: Size(
                    320, 63
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.white,
                side: BorderSide(width:1, color: Color(0xff8a93bc)),
              ),
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
