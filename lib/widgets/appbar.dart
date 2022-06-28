import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

myappbar(BuildContext context,Widget appwidget,Widget actions ,) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 100,
    backgroundColor: Colors.white,
    elevation: 0.3,actions: [actions],title: appwidget,
  );
}
