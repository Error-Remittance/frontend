import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/utils.dart';
import 'package:frontend/mainView/selectAskReturn//selectAskReturnRequest.dart';

class SelectAskReturnFormPage extends StatefulWidget {
  const SelectAskReturnFormPage({Key? key}) : super(key: key);

  @override
  _SelectAskReturnFormPageState createState() => _SelectAskReturnFormPageState();
}

class _SelectAskReturnFormPageState extends State<SelectAskReturnFormPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  
  List<bool> isChecked = [false, false, false, false];
  List<String> _checkText = ["송금액 오기입", "계좌번호 오기입", "거래 취소", "기타"];
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: const Color(0xff5CAAFF),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5, left: 5),
                          child: const Text(
                            "알림",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 45,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 8,
                                offset: const Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const Text(
                            "오송금반환요청",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 45,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 8,
                                offset: const Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const Text(
                            "착송어플다운요망",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5, left: 5),
                          child: const Text(
                            "수취인 정보",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 45,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 8,
                                offset: const Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "은행 선택",
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.chevron_right, color: Colors.black,),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 45,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 8,
                                offset: const Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText:'',
                              hintText: '계좌번호 기입',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5, left: 5),
                          child: const Text(
                            "착오송금 발생 금액",
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
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38.withOpacity(0.2),
                                spreadRadius: 0.1,
                                blurRadius: 8,
                                offset: const Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            onChanged: (text) {},
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            ],
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText:'',
                              hintText: '원',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 5, left: 5),
                          child: const Text(
                            "사유 체크란",
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
                            borderRadius: BorderRadius.circular(10),
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
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 567,),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          NoAnimationMaterialPageRoute(
                            builder: (context) => SelectAskReturnRequestPage(),
                          ),
                        );
                      },
                      icon: Image.asset('lib/assets/button_submit.png'),
                      iconSize: 80,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
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