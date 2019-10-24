import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/index_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IndexPage();
});
//
//var nothingHandler = Handler(
//  handlerFunc: (BuildContext context, Map<String, List<String> params) {
//
//}
//);
