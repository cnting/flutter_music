import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

Handler commonHandler(Widget page) {
  return Handler(handlerFunc:
      (BuildContext context, Map<String, List<String>> parameters) {
    return page;
  });
}
