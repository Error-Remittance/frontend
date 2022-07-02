import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectAskReturn/selectAskReturnForm.dart';

class SelectBank extends StatefulWidget {
  final dx;
  final dy;
  const SelectBank({Key? key, required this.dx, required this.dy,}) : super(key: key);

  @override
  _SelectBankState createState() => _SelectBankState();
}

class _SelectBankState extends State<SelectBank> {

  final accountItem = [
    "lib/assets/accounts/NH_bank.png",
    "lib/assets/accounts/Woori_bank.png",
    "lib/assets/accounts/Shinhan_bank.png",
    "lib/assets/accounts/KB_bank.png",
    "lib/assets/accounts/Hana_bank.png",
    "lib/assets/accounts/Foreign_bank.png",
    "lib/assets/accounts/IBK_bank.png",
    "lib/assets/accounts/Kakao_bank.png",
    "lib/assets/accounts/Saemaul_bank.png",
    "lib/assets/accounts/Busan_bank.png",
    "lib/assets/accounts/Kyongnam_bank.png",
    "lib/assets/accounts/Gwangju_bank.png",
    "lib/assets/accounts/Jeonbuk_bank.png",
    "lib/assets/accounts/Credit_Union_bank.png",
    "lib/assets/accounts/SC_bank.png",
    "lib/assets/accounts/KDB_bank.png",
    "lib/assets/accounts/DGB_bank.png",
    "lib/assets/accounts/Jeju_bank.png",
    "lib/assets/accounts/Post_bank.png",
    "lib/assets/accounts/Suhyup_bank.png",
  ];

  final accountName = [
    "NH농협은행",
    "우리은행",
    "신한은행",
    "KB국민은행",
    "하나은행",
    "외환은행",
    "IBK기업은행",
    "카카오뱅크",
    "새마을금고",
    "부산은행",
    "경남은행",
    "광주은행",
    "전북은행",
    "신협은행",
    "SC제일은행",
    "KDB산업은행",
    "대구은행",
    "제주은행",
    "우체국",
    "수협은행",
  ];

  var appbarHeight = AppBar().preferredSize.height;

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
                    child: Text("은행 선택"),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 0, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.8 - MediaQuery.of(context).padding.top - appbarHeight,
                    child: GridView.builder(
                      itemCount: accountItem.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        mainAxisSpacing: 0, //수평 Padding
                        crossAxisSpacing: 7.5, //수직 Padding
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        //item 의 반목문 항목 형성
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  NoAnimationMaterialPageRoute(
                                    builder: (context) => SelectAskReturnFormPage(
                                      dx: widget.dx,
                                      dy: widget.dy,
                                      bank: accountName[index],
                                    ),
                                  ),
                                );
                              },
                              child: Image(
                                image: AssetImage(accountItem[index]),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
