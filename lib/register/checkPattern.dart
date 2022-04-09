import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/register/patternLock/patternLock.dart';
import 'package:frontend/register/utils.dart';

class CheckPattern extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<int>? pattern = ModalRoute.of(context)!.settings.arguments as List<int>?;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Check Pattern"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Flexible(
            child: Text(
              "Draw Your pattern",
              style: TextStyle(fontSize: 26),
            ),
          ),
          Flexible(
            child: PatternLock(
              selectedColor: Colors.red,
              pointRadius: 8,
              showInput: true,
              dimension: 3,
              relativePadding: 0.7,
              selectThreshold: 25,
              fillPoints: true,
              onInputComplete: (List<int> input) {
                if (listEquals<int>(input, pattern)) {
                  Navigator.of(context).pop(true);
                } else {
                  context.replaceSnackbar(
                    content: const Text(
                      "wrong",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}