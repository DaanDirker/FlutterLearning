library routes;

import 'package:concept/presentation/container/WebviewContainer.dart';
import 'package:flutter/material.dart';

const String DETAIL_ROUTE = "/detail";

final Map<String, WidgetBuilder> routes = {
  DETAIL_ROUTE: (context) => WebviewContainer()
};
