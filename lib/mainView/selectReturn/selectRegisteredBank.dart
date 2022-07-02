import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectReturn/selectReturnForm.dart';

class SelectRegisteredBank extends StatefulWidget {
  final dx;
  final dy;
  const SelectRegisteredBank({Key? key, required this.dx, required this.dy,}) : super(key: key);

  @override
  _SelectRegisteredBankState createState() => _SelectRegisteredBankState();
}

class _SelectRegisteredBankState extends State<SelectRegisteredBank> {

  var appbarHeight = AppBar().preferredSize.height;

  // account list variable
  var list = ['쏠편한 입출금 통장', '쏠안편한 입출금 통장'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAEAEA),
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
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20),
              child: const Text(
                "해당 수취인의 거래은행을\n선택해주세요!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15,),
                    const Center(
                      child: Text("계좌 선택"),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.8 - MediaQuery.of(context).padding.top - appbarHeight,
                      child: Column(
                        children: [
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
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            NoAnimationMaterialPageRoute(
                                              builder: (context) => SelectReturnFormPage(dx: widget.dx, dy: widget.dy),
                                            ),
                                          );
                                        },
                                        child: Container(
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
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                              onPressed: () {

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
                        ],
                      )
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
