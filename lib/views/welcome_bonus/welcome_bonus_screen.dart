import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/main_screen.dart';
import 'package:rocki_poin_app/widgets/common_elevated_button.dart';

import '../../core/constants/app_assets.dart';

class WelcomeBonusScreen extends StatelessWidget {
  const WelcomeBonusScreen({super.key});

  static const routeName = "/welcome-bonus";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            body: Column(
              children: [
                // _buildStack(context),
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.welImgOne,
                      height: screenHeight * 0.635,
                      width: screenWidth,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: screenHeight * 0.140,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome bonus",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w900),
                          ),
                          SizedBox(height: screenHeight * 0.010),
                          Text(
                            "Congratulations, you have received\nyour first 500 rock coins",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400),
                          ),
                        ],
                      ).paddingHorizontal(screenWidth * 0.030),
                    ),
                    Positioned(
                      bottom: screenHeight * 0.060,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        AppAssets.welImgThree,
                        height: screenHeight * 0.120,
                        width: screenWidth * 0.120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.050),
                // _buildContainer(context),
                Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.090,
                  width: screenWidth * 0.390,
                  decoration: BoxDecoration(
                    color: AppColors.blue1,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "YOUR CURRENT BALANCE",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 13.sp, fontWeight: FontWeight.w400),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "500 ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: " Rock",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.130),
                CustomButton(
                  fontSize: 18.sp,
                  width: screenWidth * 0.390,
                  height: 60.h,
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen())),
                  text: "OK",
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // _buildStack(context),
                  Stack(
                    children: [
                      Image.asset(
                        AppAssets.welImgOne,
                        height: 760.h,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: screenHeight * 0.250,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcomee bonus",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: screenWidth * 0.055,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Lato"),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            Text(
                              "Congratulations, you have received\nyour first 500 rock coins",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: screenWidth * 0.025,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Lato",
                                  ),
                            ),
                          ],
                        ).paddingHorizontal(screenWidth * 0.030),
                      ),
                      Positioned(
                        bottom: screenHeight * 0.130,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          AppAssets.welImgThree,
                          height: screenHeight * 0.140,
                          width: screenWidth * 0.140,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.050),
                  // _buildContainer(context),
                  Container(
                    alignment: Alignment.center,
                    width: screenWidth * 0.6,
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                    decoration: BoxDecoration(
                      color: AppColors.blue1,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "YOUR CURRENT BALANCE",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.020,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Lato"),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "500 ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: screenWidth * 0.050,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Lato",
                                    ),
                              ),
                              TextSpan(
                                text: " Rock",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: screenWidth * 0.040,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Lato",
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.140),
                  CustomButton(
                    fontSize: screenWidth * 0.030,
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.070,
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen())),
                    text: "OK",
                  ),
                  SizedBox(height: screenHeight * 0.1),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80.h,
      width: 310.w,
      decoration: BoxDecoration(
        color: AppColors.blue1,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "YOUR CURRENT BALANCE",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "500 ",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 30.sp, fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: " Rock",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 25.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.welImgOne,
          height: 483.h,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Positioned(
          top: 110.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome bonus",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 32.sp, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 45.w),
                  // Image.asset(
                  //   AppAssets.welImgTwo,
                  //   height: 75.h,
                  //   width: 75.w,
                  //   fit: BoxFit.contain,
                  // ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                "Congratulations, you have received\nyour first 500 rock coins",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ).paddingHorizontal(20.w),
        ),
        Positioned(
          bottom: 0.h,
          left: 0,
          right: 0,
          child: Image.asset(
            AppAssets.welImgThree,
            height: 200.h,
            width: 200.w,
          ),
        ),
      ],
    );
  }
}
