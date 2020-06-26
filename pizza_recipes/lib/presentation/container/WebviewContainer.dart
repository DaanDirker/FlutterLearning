import 'package:concept/data/model/WebviewArgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WebviewArgs args = ModalRoute.of(context).settings.arguments;

    return WebviewScaffold(
        url: args.href,
        appBar: AppBar(
          title: Text(args.title),
        ));
  }
}
