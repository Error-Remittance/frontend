import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectAskReturn/selectAskReturn.dart';
import 'package:frontend/mainView/selectReturn/selectReturn.dart';
import 'package:frontend/mainView/accountList.dart';

class SelectProcessPage extends StatefulWidget {
  const SelectProcessPage({Key? key}) : super(key: key);

  @override
  _SelectProcessPageState createState() => _SelectProcessPageState();
}

class _SelectProcessPageState extends State<SelectProcessPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.white, // Appbar 배경색
        elevation: 0.0, // Appbar 그림자
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              NoAnimationMaterialPageRoute(
                builder: (context) => AccountListPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "착오송금 항목 선택",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () { return Future(() => true); },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 40),
                child: const Text(
                  "선택하신 계좌를 통해\n어떤 업무를 진행하실건가요?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1690F0),
                    border:  Border.all(
                      color: const Color(0xFF1690F0),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "SOL 통장",
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
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          '100,000'+'원',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        NoAnimationMaterialPageRoute(
                          builder: (context) => SelectAskReturnPage(),
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
                          '반환 요청할게요!',
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
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        NoAnimationMaterialPageRoute(
                          builder: (context) => SelectReturnPage(),
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
                          '돈을 환불해줄거예요!',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}