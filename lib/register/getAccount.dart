import 'package:flutter/material.dart';

class GetAccount extends StatefulWidget {
  const GetAccount({Key? key}) : super(key: key);

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, // Appbar 배경색
        elevation: 0.0, // Appbar 그림자
        leading: IconButton(
          onPressed: () {},
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
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height*0.1,
             alignment: Alignment.center,
             margin: EdgeInsets.only(top: 10, bottom: 20),
             child: const Text(
               "드디어 마지막 단계에요!\n계좌를 연결해 '착송'해주시면 됩니다",
               style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w800,
               ),
             ),
           ),
           SingleChildScrollView(
             child: Container(
               padding: EdgeInsets.only(top: 25, left: 20, right: 20),
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height*0.71 ,
               color: Colors.black12,
               child: GridView.builder(
                 itemCount: accountItem.length,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                   mainAxisSpacing: 0, //수평 Padding
                   crossAxisSpacing: 0, //수직 Padding
                 ),
                 itemBuilder: (BuildContext context, int index) {
                   //item 의 반목문 항목 형성
                   return Container(
                     child: Column(
                       children: [
                         Image(
                           image: AssetImage(accountItem[index]),
                         ),
                       ],
                     ),
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

class MaterialPageRouteWithoutAnimation extends MaterialPageRoute {
  MaterialPageRouteWithoutAnimation({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

