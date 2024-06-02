import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key, // Corrected key definition
    required this.onPressed,
    this.height,
    this.width,
    required this.text,
    this.textColor,
    this.buttonColor,
    this.fontSize,
    this.borderRadius,
    this.buttonElevation,
    this.borderColor,

  }); // Corrected super constructor call

  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final double? buttonElevation;
  final Color? borderColor;


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: buttonElevation ?? 0.0,
      borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
      color: Colors.transparent, // Set color to transparent
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
        onTap: onPressed,
        child: Container(
          height: height ?? 20.h,
          width: width ?? 50.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor?? AppColors.blue1),
            borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
            color: buttonColor ?? AppColors.blue1,

          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: fontSize ?? 15.sp,
              color: textColor ?? AppColors.white1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}