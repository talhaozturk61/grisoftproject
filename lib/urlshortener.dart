import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:urlshortener/getxcontroller.dart';

class UrlShortener extends StatelessWidget {
  UrlShortener({Key? key}) : super(key: key);
  Future<String?> shortenUrl({required String url}) async {
    try {
      final result = await http.post(
          Uri.parse('https://cleanuri.com/api/v1/shorten'),
          body: {'url': url});

      if (result.statusCode == 200) {
        final jsonResult = jsonDecode(result.body);
        return jsonResult['result_url'];
      }
    } catch (e) {
      print('Error ${e.toString()}');
    }
    return null;
  }

  final MyController c = Get.put(MyController());
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Your search history',
          style:  TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0.3,
      ),
      body: Column(
        children: [
          Obx((() {
            return Expanded(
                child: c.mylist.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        itemCount: c.mylist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() => ListTile(
                                title: Text(c.myurl.toString(),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18)),
                                trailing: IconButton(
                                    onPressed: () {
                                      c.removelist(c.myurl.value);
                                    },
                                    icon: const Icon(Icons.delete)),
                              ));
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.info,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Sonuç Bulunamadı',
                              style: TextStyle(fontSize: 20))
                        ],
                      ));
          })),
          Container(
            height: 50,
            color: Colors.grey.shade200,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.only(left: 15),
                labelText: 'Enter your url here',
                hintText: 'https://www.example.com',
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final shortenedUrl = await shortenUrl(url: controller.text);

              if (shortenedUrl != null) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Url Shortened Successfully'),
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      color: Colors.grey.withOpacity(.2),
                                      child: Text(shortenedUrl),
                                    ),
                                  ),
                                  Flexible(
                                    child: IconButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                                  text: shortenedUrl))
                                              .then((_) => ScaffoldMessenger.of(
                                                      context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Urls is copied to the clipboard'))));
                                        },
                                        icon: const Icon(Icons.copy)),
                                  )
                                ],
                              ),
                              ElevatedButton.icon(
                                  onPressed: () {
                                    controller.clear();
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close),
                                  label: const Text('Close'))
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please provide a url',
                      style: TextStyle(color: Colors.red)),
                ));
              }
              c.myurl.value = controller.text;
              if (controller.text.isNotEmpty) {
                c.addlist(shortenedUrl.toString());
              }
            },
            child: Container(
              color: Colors.blueAccent.shade100,
              height: 50,
              child: const Center(
                  child: Text(
                'Click',
                style: TextStyle(fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
