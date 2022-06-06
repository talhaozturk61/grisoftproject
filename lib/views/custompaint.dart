import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urlshortener/widgets/clipper.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        child: const Text(
          'Go Back',
          style: TextStyle(fontSize: 10),
        ),
      ),
      body: ClipPath(
        clipper: MyClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
