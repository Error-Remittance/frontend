import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectReturn/declineConfirm.dart';
import 'package:frontend/alertWindow.dart';

class SelectReturnDecline extends StatefulWidget {
  final dx;
  final dy;
  const SelectReturnDecline({Key? key, required this.dx, required this.dy}) : super(key: key);

  @override
  _SelectReturnDeclineState createState() => _SelectReturnDeclineState();
}

class _SelectReturnDeclineState extends State<SelectReturnDecline> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var appbarHeight = AppBar().preferredSize.height;

  List<bool> isChecked = [false, false, false, false];
  List<String> _checkText = ["정당한 거래", "악용자 의심", "금액 오류", "기타"];
  DateTime selectDate = DateTime.utc(9999);

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
          "착오송금 반환 요청",
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
                    height: 150, //MediaQuery.of(context).size.height * 0.5,
                    color: const Color(0xff5CAAFF),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, left: 5),
                        child: const Text(
                          "반환 거절 사유",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 150,
                        padding: const EdgeInsets.only(top: 10, bottom: 10,left: 10, right: 10),
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
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 32,
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    value: isChecked[index],
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked[index] = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    _checkText[index],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  index == 3
                                      ? SizedBox(
                                    width: 200,
                                    height: 50,
                                    child: TextFormField(
                                      maxLength: 30,
                                      onChanged: (text) {},
                                      decoration: const InputDecoration(
                                        // border: InputBorder.none,
                                        counterText:'',
                                        hintText: '최대 30자까지 사유를 기입해주세요.',
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                      : Container(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: widget.dx,
                  top: widget.dy - MediaQuery.of(context).padding.top - appbarHeight,
                  child: IconButton(
                    onPressed: () {
                      isChecked[0] || isChecked[1] || isChecked[2] || isChecked[3] ?
                      Navigator.push(
                        context,
                        NoAnimationMaterialPageRoute(
                          builder: (context) => DeclineConfirm(),
                        ),
                      ) : FlutterDialog("사유 체크란에 사유를 체크해주세요.\n(기타 체크 시 글 작성 필요)");
                    },
                    icon: Image.asset('lib/assets/button_submit.png'),
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

  // ignore: non_constant_identifier_names
  void FlutterDialog(String text) {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertWindow(contents: text);
        }
    );
  }
}