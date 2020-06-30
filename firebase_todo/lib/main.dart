import 'package:firebase_todo/src/presentation/screens/TodoScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_todo/src/util/constants.dart' as Constants;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
        shape: BeveledRectangleBorder(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Constants.APP_DISPLAY_NAME),
            Container(
                margin: EdgeInsets.only(left: 8.0, top: 4.0),
                child: Icon(Icons.av_timer))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: _buildAppBar(),
        body: TodoScreen(),
      ),
    );
  }
}
