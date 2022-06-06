import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:urlshortener/models/getxcontroller_service.dart';
import 'package:urlshortener/models/shortenurl_service.dart';
import 'package:urlshortener/widgets/drawerwidget.dart';

class UrlShortener extends StatelessWidget {
  const UrlShortener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final MyController c = Get.put(MyController());

    final controller = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Your search history',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        elevation: 0.3,
      ),
      body: Column(
        children: [
         
          Obx((() {
            return Expanded(
                child: c.mylist.isNotEmpty
                    ? ListView.builder(
                        itemCount: c.mylist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Obx((() => Text(c.mylist[index],
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18))))
,                            trailing: IconButton(
                                onPressed: () {
                                  c.removelist(c.mylist[index].toString());
                                },
                                icon: const Icon(Icons.delete)),
                          );
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
                          Text('search history clean..',
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
                                              .then((_) => Get.snackbar(
                                                  "Succesfull",
                                                  "url copied succesfully",
                                                  icon: const Icon(Icons.done,
                                                      size: 26,
                                                      color: Colors.black),
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                  colorText: Colors.green));
                                        },
                                        icon: const Icon(Icons.copy)),
                                  )
                                ],
                              ),
                              ElevatedButton.icon(
                                  onPressed: () {
                                    controller.clear();
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.close),
                                  label: const Text('Close'))
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                Get.snackbar("Url Error", "Please provide a url",
                    icon: const Icon(Icons.info, color: Colors.black),
                    snackPosition: SnackPosition.TOP,
                    colorText: Colors.red);
              }

              controller.text = shortenedUrl.toString();
              if (controller.text.isNotEmpty && controller.text != 'null') {
                c.mylink.value = controller.text;

                c.addlist(c.mylink.value);
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
