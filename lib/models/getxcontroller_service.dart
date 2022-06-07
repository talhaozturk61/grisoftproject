import 'dart:convert';

import 'package:get/get.dart';

class MyController extends GetxController {
  var mylist = <MyLinkList>[].obs;
  var shortlink = ''.obs;
  var longlink = ''.obs;

  removelist(
    mylink,
  ) {
    mylist.remove(mylink);
  }

  addlist(shortlink,longlink) {
    mylist.add(MyLinkList(long: longlink, short: shortlink));
  }
}

class MyLinkList {
  String long;
  String short;
  MyLinkList({
    required this.long,
    required this.short,
  });
}
