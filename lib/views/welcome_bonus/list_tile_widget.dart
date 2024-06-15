import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 600){
          return Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              color: AppColors.blue1,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              onTap: () {
                print('Tapped on $titleText'); // Debug statement

                Navigator.pushNamed(context, navigatorPath);
              },
              leading: SvgPicture.asset(
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
        else{
          return Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: screenHeight * 0.088,
            decoration: BoxDecoration(
              color: AppColors.blue1,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: ListTile(
              onTap: () {
                print('Tapped on $titleText'); // Debug statement

                Navigator.pushNamed(context, navigatorPath);
              },
              leading: SvgPicture.asset(
                imgPath,
                height: screenHeight * 0.055,
                width: screenWidth * 0.055,
                fit: BoxFit.contain,
              ),
              title: Text(
                titleText,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: screenWidth * 0.028,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white1,
                  fontFamily: "Lato"
                ),
              ),
              subtitle: Text(
                subTitleText,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: screenWidth * 0.020,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white1,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.white1,
                size: screenWidth * 0.035,
              ),
            ),
          );
        }
      },
    );
  }
}
