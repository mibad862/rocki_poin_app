import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        clipBehavior: Clip.none,
        width: double.infinity,
        height: 250.h,
        color: Colors.white,
      ),
    );
  }
}


class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    double w = size.width;
    double h = size.height;

    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0010000,size.height*0.3000000);
    path_0.quadraticBezierTo(size.width*0.0060000,size.height*0.2085000,size.width*0.0510000,size.height*0.2020000);
    path_0.cubicTo(size.width*0.1371250,size.height*0.2017500,size.width*0.2771800,size.height*0.1968600,size.width*0.3806800,size.height*0.1998600);
    path_0.cubicTo(size.width*0.3983200,size.height*0.1974200,size.width*0.4777900,size.height*0.2697400,size.width*0.5006600,size.height*0.2619800);
    path_0.cubicTo(size.width*0.5275300,size.height*0.2645600,size.width*0.6024800,size.height*0.1936400,size.width*0.6153800,size.height*0.1999400);
    path_0.cubicTo(size.width*0.7167800,size.height*0.1981400,size.width*0.8636375,size.height*0.2014850,size.width*0.9500000,size.height*0.2020000);
    path_0.quadraticBezierTo(size.width*0.9982500,size.height*0.2165000,size.width*0.9990000,size.height*0.3000000);
    path_0.lineTo(size.width*0.9980000,size.height*0.7980000);
    path_0.lineTo(0,size.height*0.7980000);
    path_0.lineTo(size.width*-0.0010000,size.height*0.3000000);
    path_0.close();


    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
