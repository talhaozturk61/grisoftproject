import 'dart:convert';

import 'package:get/get.dart';

class MyController extends GetxController {
  final mylist = <String>[].obs;

  removelist(
    String url,
  ) {
    mylist.remove(url);
  }

  addlist(String url) {
    mylist.add(url);
  }
}
