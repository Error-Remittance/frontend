import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectAskReturn/selectAskReturnForm.dart';
import 'package:frontend/alertWindow.dart';

class SelectAskReturnPage extends StatefulWidget {
  const SelectAskReturnPage({Key? key}) : super(key: key);

  @override
  _SelectAskReturnPageState createState() => _SelectAskReturnPageState();
}

class _SelectAskReturnPageState extends State<SelectAskReturnPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<String> terms = [
    "송금 시 수취인에게 표시할 송금인명을 착송 팀이 임의로 변경하는 것에 동의합니다.",
    "수취인이 반환 요청에 동의할 시 서비스 이용수수료를 제외한 금액이 반환되는 것에 동의합니다.",
    "1원을 두 번 나눠 송금하는 행동과 1원 송금 시 본인인증을 한 번만 진행함을 동의함니다.",
    "오송금 발생 유무를 확인하기 위해 반환 이후 사용자의 거래내역에 대한 접근을 허가해주는 것에 동의합니다.",
    "(선택)마케팅 동의란",
  ];

  bool isAllChecked = false;
  List<bool> isChecked = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      key: _key,
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
        centerTitle: true,
        title: const Text(
          "착오송금 반환 요청",
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
                margin: const EdgeInsets.only(top: 15, left: 15),
                child: const Text(
                  "착오송금 반환 요청을 위한\n약관동의가 필요합니다.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Container(
                    padding: const EdgeInsets.only(top: 25),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 60,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffC1C1C1),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                  ),
                                ),
                                value: isAllChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isAllChecked = value!;
                                    if(isAllChecked) {
                                      isChecked[0] = true;
                                      isChecked[1] = true;
                                      isChecked[2] = true;
                                      isChecked[3] = true;
                                      isChecked[4] = true;
                                    } else {
                                      isChecked[0] = false;
                                      isChecked[1] = false;
                                      isChecked[2] = false;
                                      isChecked[3] = false;
                                      isChecked[4]= false;
                                    }
                                  });
                                },
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: const Text(
                                  '전체동의',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.925,
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Checkbox(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)
                                              ),
                                            ),
                                            value: isChecked[index],
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked[index] = value!;
                                                if(!isChecked[index]) {
                                                  isAllChecked = false;
                                                }
                                                if(isChecked[0] && isChecked[1] && isChecked[2] && isChecked[3] && isChecked[4]) {
                                                  isAllChecked = true;
                                                }
                                              });
                                            },
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(left: 7.5),
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            child: Text(
                                              terms[index],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: IconButton(
                  onPressed: () {
                    isChecked[0] && isChecked[1] && isChecked[2] && isChecked[3] ?
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                        builder: (context) => SelectAskReturnFormPage(),
                      ),
                    ) : FlutterDialog("필수 약관에 동의해주세요.");
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
