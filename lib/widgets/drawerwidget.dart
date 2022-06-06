import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urlshortener/views/custompaint.dart';



class DrawerWidget extends StatelessWidget {
  const DrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            InkWell(
              onTap: () {
                Get.to(const CustomPaintPage());
              },
              child: const ListTile(
                title: Text('Go to CustomPaint Page'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      );
  }
}