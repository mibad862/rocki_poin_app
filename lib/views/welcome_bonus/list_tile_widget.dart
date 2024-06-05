import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.imgPath,
    required this.titleText,
    required this.subTitleText,
    required this.navigatorPath,
  });

  final String imgPath;
  final String titleText;
  final String subTitleText;
  final String navigatorPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.blue1,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, navigatorPath);
        },
        leading: Image.asset(
          imgPath,
          height: 48.h,
          width: 48.w,
          fit: BoxFit.contain,
        ),
        title: Text(
          titleText,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.white1,
          ),
        ),
        subtitle: Text(
          subTitleText,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white1,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.white1,
        ),
      ),
    );
  }
}
