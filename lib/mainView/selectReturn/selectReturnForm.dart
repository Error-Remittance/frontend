import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectReturn/selectReturnRequest.dart';

class SelectReturnFormPage extends StatefulWidget {
  final double dx;
  final double dy;
  const SelectReturnFormPage({Key? key, required this.dx, required this.dy}) : super(key: key);

  @override
  _SelectReturnFormPageState createState() => _SelectReturnFormPageState();
}

class _SelectReturnFormPageState extends State<SelectReturnFormPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var appbarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      key: _key,
      appBar: AppBar(
        backgroundColor: const Color(0xff5CAAFF), // Appbar 배경색
        elevation: 0.0, // Appbar 그림자
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "착오송금 반환 동의",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () { return Future(() => true); },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - appbarHeight - MediaQuery.of(context).padding.top,
                    color: const Color(0xffffffff),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    color: const Color(0xff5CAAFF),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, left: 5),
                        child: const Text(
                          "송금인",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38.withOpacity(0.2),
                              spreadRadius: 0.1,
                              blurRadius: 8,
                              offset: const Offset(0, 6), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "김우리",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, left: 5),
                        child: const Text(
                          "착오송금 정보",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38.withOpacity(0.2),
                              spreadRadius: 0.1,
                              blurRadius: 8,
                              offset: const Offset(0, 6), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "25,000원",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38.withOpacity(0.2),
                              spreadRadius: 0.1,
                              blurRadius: 8,
                              offset: const Offset(0, 6), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "2021년 4월 5일 오후 11:00",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  left: 20,
                  right: 20,
                  top: 250,
                  child: Text(
                    "‘김우리’님으로부터 25,000원을 [신한은행-1234567890]계좌로 받은 "
                        "내역이 있는지 다시 한 번 확인해주세요!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff3E97F7),
                      fontSize: 12,
                    ),
                  ),
                ),
                const Positioned(
                  left: 20,
                  right: 20,
                  top: 325,
                  child: Text(
                    "착송팀이 재확인한 후 돈을 반환하지만, \n"
                    "‘김우리’님의 송금 정보가 존재하지 않으면 처리가 오래 걸립니다.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffFF4141),
                      fontSize: 12,
                    ),
                  ),
                ),
                Positioned(
                  left: widget.dx,
                  top: widget.dy - MediaQuery.of(context).padding.top - appbarHeight,
                  child: IconButton(
                    onPressed: () {
                      // print('${widget.dx}, ${widget.dy}');
                      Navigator.push(
                        context,
                        NoAnimationMaterialPageRoute(
                          builder: (context) => SelectReturnRequestPage(dx: widget.dx, dy: widget.dy,),
                        ),
                      );
                    },
                    icon: Image.asset('lib/assets/button_next.png'),
                    iconSize: 80,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
