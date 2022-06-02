import 'package:flutter/material.dart';

class CustomPaint extends StatelessWidget {
  const CustomPaint({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:    ClipPath(
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 130);
    var controllPoint = Offset(30, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
