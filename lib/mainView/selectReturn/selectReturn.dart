import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectReturn/selectReturnForm.dart';
import 'package:frontend/mainView/selectReturn/selectRegisteredBank.dart';
import 'package:frontend/alertWindow.dart';

class SelectReturnPage extends StatefulWidget {
  const SelectReturnPage({Key? key}) : super(key: key);

  @override
  _SelectReturnPageState createState() => _SelectReturnPageState();
}

class _SelectReturnPageState extends State<SelectReturnPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final GlobalKey _widgetKey = GlobalKey();

  List<String> terms = [
    "오송금 발생 유무를 확인하기 위해 반호나 이후 사용자의 거래내역에 대한 접근을 허가해주는 것에 동의합니다.",
    "본 착송팀이 해당 금액 반환 확인이 된 이후 수고비를 제공해주는 것에 동의합니다.",
    "(선택)마케팅 동의란",
  ];

  bool isAllChecked = false;
  List<bool> isChecked = [false, false, false];

  _getPosition(GlobalKey key) {
    if (key.currentContext != null) {
      final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero); return position;
    }
  }

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
          "착오송금 반환 동의",
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
                margin: const EdgeInsets.only(top: 15, left: 20),
                child: const Text(
                  "착오송금 반환을 위한\n약관동의가 필요합니다.",
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
                                    } else {
                                      isChecked[0] = false;
                                      isChecked[1] = false;
                                      isChecked[2] = false;
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
                                  itemCount: 3,
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
                                                if(isChecked[0] && isChecked[1] && isChecked[2]) {
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
                  key: _widgetKey,
                  onPressed: () {
                    print("${_getPosition(_widgetKey).dx}, ${_getPosition(_widgetKey).dy}");
                    isChecked[0] && isChecked[1] ?
                    Navigator.push(
                      context,
                      NoAnimationMaterialPageRoute(
                        builder: (context) => SelectRegisteredBank(dx: _getPosition(_widgetKey).dx, dy: _getPosition(_widgetKey).dy,),
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
