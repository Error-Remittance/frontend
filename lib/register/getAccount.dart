import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/inputAccountNumber.dart';

class GetAccount extends StatefulWidget {
  final String text;
  final int tag;
  const GetAccount({Key? key, required this.text, required this.tag}) : super(key: key);

  @override
  _GetAccountState createState() => _GetAccountState();
}

class _GetAccountState extends State<GetAccount> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAEAEA),
      appBar: AppBar(
        backgroundColor: Colors.white, // Appbar 배경색
        elevation: 0.0, // Appbar 그림자
        leading: IconButton(
          onPressed: () {
            widget.tag == 1 ? Navigator.pop(context) : null;
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
             margin: const EdgeInsets.only(bottom: 20),
             padding: const EdgeInsets.only(top: 10, bottom: 20, left: 15),
             child: Text(
               widget.text,
               style: const TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w800,
               ),
             ),
           ),
           SingleChildScrollView(
             child: Container(
               padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height*0.65,
               child: GridView.builder(
                 itemCount: accountItem.length,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                   mainAxisSpacing: 0, //수평 Padding
                   crossAxisSpacing: 0, //수직 Padding
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
                               builder: (context) => InputAccountNumber(text: accountName[index], tag: widget.tag,),
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
           ),
         ],
       ),
      ),
    );
  }
}
