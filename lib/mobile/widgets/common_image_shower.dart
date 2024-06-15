import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonImageShower extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImageShower({super.key,
    required this.assetName,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the image format based on the file extension
    bool isSvg = assetName.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain, // Default to BoxFit.contain if null
      );
    } else {
      return Image.asset(
        assetName,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain, // Default to BoxFit.contain if null
      );
    }
  }
}
