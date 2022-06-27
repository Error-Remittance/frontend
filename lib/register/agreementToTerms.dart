import 'package:flutter/material.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/register/setPattern.dart';
import 'package:frontend/alertWindow.dart';

class AgreementToTermsModal extends StatefulWidget {
  const AgreementToTermsModal({Key? key}) : super(key: key);

  @override
  _AgreementToTermsModalState createState() => _AgreementToTermsModalState();
}

class _AgreementToTermsModalState extends State<AgreementToTermsModal> {

  bool isAllChecked = false;

  List<String> terms = [
    "착송 필수 항목 모두 동의",
    "휴대폰/카드 본인확인 서비스",
    "문자/이메일 수신 동의",
    "(선택) 맞춤형 광고 동의",
    "(선택) 마케팅 정보 수신 동의",
  ];

  List<bool> isChecked = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Container(
        padding: const EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color(0xff000000),
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      '약관에 모두 동의',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  // 체크박스 들어갈 자리
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Checkbox(
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
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.85,
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
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
                              margin: const EdgeInsets.only(left: 20),
                              child: Text(
                                terms[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: const Icon(
                                Icons.chevron_right,
                                color: Color(0xff626262),
                                size: 30,
                              ),
                            ),
                          ],
                        );
                      }
                  ),

                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  isChecked[0] && isChecked[1] && isChecked[2] ?
                  Navigator.push(
                    context,
                    NoAnimationMaterialPageRoute(
                      builder: (context) => SetPattern(),
                    ),
                  ) : FlutterDialog("필수 약관에 동의해주세요.");
                },
                child: const Text(
                  '확인',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  animationDuration: const Duration(days: 10000),
                  splashFactory: NoSplash.splashFactory,
                  fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.85,
                      50
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: isChecked[0] && isChecked[1] && isChecked[2] ? const Color(0xff64ACF9) : const Color(0xffd9d9d9),
                  // side: isChecked[0] && isChecked[1] && isChecked[2] ? BorderSide(width:1, color: Color(0xff64ACF9)) : BorderSide(width:1, color: Color(0xffd9d9d9)),
                ),
              ),
            ),
          ],
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