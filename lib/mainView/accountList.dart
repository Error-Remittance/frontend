import 'package:flutter/material.dart';
import 'package:frontend/register/getAccount.dart';
import 'package:frontend/mainView/selectProcess.dart';
import 'package:frontend/mainView/utils.dart';
import 'package:frontend/mainView/mainAppBar/appBarDrawer.dart';
import 'package:frontend/utils.dart';

class AccountListPage extends StatefulWidget {
  const AccountListPage({Key? key}) : super(key: key);

  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountListPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  // account list variable
  var list = ['쏠편한 입출금 통장', '쏠안편한 입출금 통장'];

  // add account
  String addAccountText = "계좌를 추가하셔서\n더 다양한 거래를 진행해봐요!";
  int addAccountTag = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
          backgroundColor: Colors.white, // Appbar 배경색
          elevation: 1, // Appbar 그림자
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ]
      ),
      endDrawer: AppBarDrawerPage(),
      body: WillPopScope(
        onWillPop: onWillPop, //() { return Future(() => false); },
          child: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 15),
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12)),
                    ),
                    child: const Text(
                      '김철수님',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        NoAnimationMaterialPageRoute(
                            builder: (context) => SelectProcessPage(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(top: 10),
                          child: const Text(
                              "SOL 통장",
                              style: TextStyle(
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
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      animationDuration: const Duration(days: 10000),
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.80,
                        130,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      primary: const Color(0xFF1690F0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: 275,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black12)),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(
                                    14, 10, 14, 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 15),
                                        width: 25,
                                        height: 25,
                                        child: Image.asset(
                                          'lib/assets/shinhanbank_logo.png',
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            list[index % 2].toString(),
                                            style: const TextStyle(
                                              color: Color(0xFFA7A7A7),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Text(
                                            '510,000',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: Color(0xFF3A3A3A),
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          NoAnimationMaterialPageRoute(
                              builder: (context) => GetAccount(text: addAccountText, tag: addAccountTag)
                          ),
                        );
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          color: Color(0xFF717171),
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        animationDuration: const Duration(days: 10000),
                        fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.8,
                            33
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: const Color(0xFFFAFAFA),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Divider(
                      height: 25,
                      thickness: 1.3,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/chatbot_icon.png',
                            fit: BoxFit.contain,
                            height: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 7.5,
                          ),
                          const Text(
                            '챗봇 상담',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        animationDuration: const Duration(days: 10000),
                        splashFactory: NoSplash.splashFactory,
                        fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.8,
                            40
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: const Color(0xFF1690F0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}





