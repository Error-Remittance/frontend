import 'package:flutter/material.dart';
import 'package:frontend/mainView/selectProcess.dart';
import 'package:frontend/mainView/confirmPattern.dart';

class SelectAskReturnRequestPage extends StatefulWidget {
  const SelectAskReturnRequestPage({Key? key}) : super(key: key);

  @override
  _SelectAskReturnRequestPageState createState() => _SelectAskReturnRequestPageState();
}

class _SelectAskReturnRequestPageState extends State<SelectAskReturnRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()  { return Future(() => true); },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.only(left: 15, right: 15),
                width: MediaQuery.of(context).size.width * 0.80,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFF1690F0),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.2),
                      spreadRadius: 0.1,
                      blurRadius: 8,
                      offset: const Offset(0, 6), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "김우리 | 신한은행",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 4),
                      child: const Text(
                          "1002-123-456789",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(top: 10),
                            child: const Text(
                                "김값아 | 우리은행",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                )
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.only(top: 4),
                            child: const Text(
                                "1234567890",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "해당 송금내역에 대해\n반환을 요청하시겠습니까?",
                style: TextStyle(
                  color: Color(0xff3E97F7),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "해당 반환 요청으로 수취인 대금 2,500원\n"
                "수고비 500원이 발생해 3,500원의 수수료가 발생합니다.\n"
                "(수취인이 반환하면 수수료를 차감한 금액만큼 돌려드립니다.)",
                style: TextStyle(
                  color: Color(0xff808080),
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRouteWithoutAnimation(
                        builder: (context) => ConfirmPattern(tag: 0,),
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
                    Navigator.push(
                      context,
                      MaterialPageRouteWithoutAnimation(
                        builder: (context) => SelectProcessPage(),
                      ),
                    );
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
}

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
