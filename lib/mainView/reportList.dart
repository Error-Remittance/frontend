import 'package:flutter/material.dart';
import 'package:frontend/mainView/accountList.dart';
import 'package:page_transition/page_transition.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({Key? key}) : super(key: key);

  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportListPage> {
  @override
  void initState() {
    // _returnRequests();
  }

  // account date variable -- dummy data
  var month = [6, 7, 8, 10, 12];
  var day = [28, 2, 6, 20, 25];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white, // Appbar 배경생
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: const AccountListPage(),
                  ),
                );
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black87,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            '신고건 목록',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.push(
              context,
              MaterialPageRouteWithoutAnimation(
                builder: (context) => const AccountListPage(),
              ),
            );
            return true;
          },
          child: Column(
          children: <Widget>[
            // const Spacer(),
            Container(
              margin: const EdgeInsets.only(top:20),
              height: MediaQuery.of(context).size.height * 0.84,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Text(
                                  month[index % 5].toString().padLeft(2, '0')+'.'+
                                  day[index % 5].toString().padLeft(2, '0'),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(left: 2, right: 2),
                                height: 100,
                                child: const VerticalDivider(
                                  color: Colors.black38,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                margin: const EdgeInsets.only(right: 25),
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 80,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    primary: const Color(0xFFFF766D),
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              "김도둑",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '10,000 원',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "1002-123-45678",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '|',
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '18시 30분',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
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
