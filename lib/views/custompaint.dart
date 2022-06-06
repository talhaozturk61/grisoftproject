import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urlshortener/widgets/clipper.dart';

class CustomPaintPage extends StatefulWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  State<CustomPaintPage> createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        child: const Text('Go Back',style: TextStyle(fontSize: 10),),
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

