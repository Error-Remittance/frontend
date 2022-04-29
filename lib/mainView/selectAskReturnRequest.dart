import 'package:flutter/material.dart';

class SelectAskReturnRequestPage extends StatefulWidget {
  const SelectAskReturnRequestPage({Key? key}) : super(key: key);

  @override
  _SelectAskReturnRequestPageState createState() => _SelectAskReturnRequestPageState();
}

class _SelectAskReturnRequestPageState extends State<SelectAskReturnRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()  { return Future(() => true); },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('lib/assets/button_accept.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('lib/assets/button_decline.png'),
                  iconSize: 80,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
              ],
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
