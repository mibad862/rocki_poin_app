import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class SectionTwoDesign extends StatelessWidget {
  const SectionTwoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -90.h,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.only(bottom: 5.h, right: 8.w, left: 8.w),
        alignment: Alignment.center,
        width: 355.w,
        height: 162.h,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(18.0),
          image: DecorationImage(
            image:
            AssetImage('assets/images/home_screen_img_cover.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/homImgTwo.svg',
                      height: 26.h,
                      width: 26.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "CURRENT BALANCE",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white1,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "LEVEL 1",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.homImgFifteen,
                  height: 30.h,
                  width: 30.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10.w),
                Text(
                  "25,589 M",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.blue1,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Earning Rate",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white1,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "300 8hrs",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.green1,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "Rock",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
