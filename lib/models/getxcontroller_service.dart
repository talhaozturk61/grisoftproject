import 'dart:convert';

import 'package:get/get.dart';

class MyController extends GetxController {
  List mylist = [].obs;
  RxString mylink = ''.obs;

  removelist(
   mylink,
  ) {
    mylist.remove(mylink);
  }

  addlist(mylink) {
    mylist.add(mylink);
  }
}
