import 'package:flutter/material.dart';

class AlertWindow extends StatefulWidget {
  final String contents;
  const AlertWindow({Key? key, required this.contents}) : super(key: key);

  @override
  _AlertWindowState createState() => _AlertWindowState();
}

class _AlertWindowState extends State<AlertWindow> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      //Dialog Main Title
      title: Column(
        children: const <Widget>[
          Text("알림창"),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              widget.contents,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Center(
            child: Text("확인"),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}