import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectReturn/selectReturnDecline.dart';
import 'package:frontend/mainView/confirmPattern.dart';
import 'package:frontend/mainView/accountList.dart';

class SelectReturnRequestPage extends StatefulWidget {
  final double dx;
  final double dy;
  const SelectReturnRequestPage({Key? key, required this.dx, required this.dy}) : super(key: key);

  @override
  _SelectReturnRequestPageState createState() => _SelectReturnRequestPageState();
}

class _SelectReturnRequestPageState extends State<SelectReturnRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()  { return Future(() => true); },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "착오송금액 반환에 \n동의하시겠습니까?",
                style: TextStyle(
                  color: Color(0xff3E97F7),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "거부 시 예금보험공사에서 지급명령을 신청할 수 있고, \n"
                "착오송금액 무단 사용 시 횡령죄로 처벌받을 수 있습니다.",
                style: TextStyle(
                  color: Color(0xff808080),
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                        builder: (context) => ConfirmPattern(tag: 1,),
                      ),
                    );
                  },
                  icon: Image.asset('lib/assets/button_accept.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    ConfrimDialog(context);
                  },
                  icon: Image.asset('lib/assets/button_decline.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void CustomDialog(BuildContext context) {
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
                Text(
                  '착오송금 반환 거부 경고',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Center(
                  child: Text(
                    '거절하셨습니다.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 7.5,),
                Center(
                  child: Text(
                    '미반환 사유 체크화면으로 이동합니다.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
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
                        Navigator.push(
                          context,
                          NoAnimationMaterialPageRoute(
                            builder: (context) => SelectReturnDecline(dx: widget.dx, dy: widget.dy,),
                          ),
                        );
                      },
                      child: const Text('확인')
                  ),
                ],
              ),
            ],
          );
        });
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
                Text(
                  '착오송금 반환 거부 경고',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Center(
                  child: Text(
                    '반환 거절 시 따르는 법적 책임은',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    ' 착송팀이 책임지지 않습니다.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 7.5,),
                Center(
                  child: Text(
                    '그래도 거절하시겠습니까?',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
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
                        Navigator.push(
                          context,
                          NoAnimationMaterialPageRoute(
                              builder: (context) => AccountListPage()
                          ),
                        );
                      },
                      child: const Text('닫기')
                  ),
                  const SizedBox(width: 50,),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        CustomDialog(context);
                      },
                      child: const Text('확인')
                  ),
                ],
              ),
            ],
          );
        });
  }
}


