import 'package:flutter/material.dart';
import 'package:frontend/mainView/accountList.dart';
import 'package:frontend/mainView/askReportReturnRequest.dart';

class SentReturnRequestListPage extends StatefulWidget {
  const SentReturnRequestListPage({Key? key}) : super(key: key);

  @override
  _SentReturnRequestListState createState() => _SentReturnRequestListState();
}

class _SentReturnRequestListState extends State<SentReturnRequestListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white, // Appbar 배경생
        elevation: 1, // Appbar 그림자
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRouteWithoutAnimation(
                builder: (context) => const AccountListPage(

                    ),
              ),
            );
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black87,
            size: 30,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          '보낸 요청 목록',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 25),
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  // color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 20, // 리스트 개수
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.black12)),
                              ),
                              child: Column(
                                children: [
                                  Theme(
                                    data: theme,
                                    child: ExpansionTile(
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(right: 15),
                                            height: 25,
                                            width: 25,
                                            child: Image.asset(
                                              'lib/assets/shinhanbank_logo.png',
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                '김도둑',
                                                style: TextStyle(
                                                  color: Color(0xFFA7A7A7),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '1002-123-45678',
                                                style: TextStyle(
                                                  color: Color(0xFF3A3A3A),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRouteWithoutAnimation(
                                                builder: (context) => const AskReportReturnRequestPage(

                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 50,
                                            color: const Color(0xFFDEECFF),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      '2022.02.05 토요일',
                                                      style: TextStyle(
                                                        color: Color(0xFFA7A7A7),
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '10,000 원',
                                                      style: TextStyle(
                                                        color: Color(0xFF3A3A3A),
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w800,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.only(right: 10),
                                                      height: 33,
                                                      width: 33,
                                                      child: Image.asset(
                                                        // 'lib/assets/icons/report_blue.png'
                                                        'lib/assets/icons/report_red.png',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
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
