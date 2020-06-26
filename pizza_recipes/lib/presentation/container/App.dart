import 'dart:math';

import 'package:concept/presentation/container/RecipesOverview.dart';
import 'package:concept/util/Constants.dart' as Constants;
import 'package:concept/util/Navigation.dart' as Navigation;
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(Constants.APP_DISPLAY_NAME),
          Container(
            margin: EdgeInsets.only(left: 2.0, top: 4.0),
            child: Transform.rotate(
              angle: 30 * pi / 180,
              child: Icon(
                Icons.local_pizza,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Navigation.routes,
      title: Constants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: _buildAppBar(),
        body: RecipesOverviewContainer(),
      ),
    );
  }
}
