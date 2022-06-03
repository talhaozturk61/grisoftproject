import 'dart:convert';

import 'package:get/get.dart';

class MyController extends GetxController {
  RxString myurl = ''.obs;



  RxList<dynamic> mylist = [].obs;




  removelist(String url) {
    mylist.remove(myurl.obs);
    
  }

  addlist(String url) {
    mylist.add(myurl.obs);
    
  }

}
