import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/views/team_screen/team_screen.dart';
import 'package:rocki_poin_app/views/welcome_bonus/list_tile_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../core/constants/app_assets.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  static const routeName = "achievement";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 210.h,
            width: double.infinity,
            color: AppColors.blue1,
            child: Column(
              children: [
                SizedBox(height: 60.h),
                SvgPicture.asset(AppAssets.achiImgOne),
                SizedBox(
                  height: 10.h,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     const _pointsWidget(
                //       imagaPath: AppAssets.achivementImgTwo,
                //       title: "Referrals",
                //       value: '139,205',
                //     ),
                //     SvgPicture.asset(
                //       AppAssets.achivementImgFour,
                //       fit: BoxFit.contain,
                //     ),
                //     const _pointsWidget(
                //       imagaPath: AppAssets.achivementImgThree,
                //       title: "Earnings",
                //       value: '121,985. rock',
                //     )
                //   ],
                // )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -20,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const ListTileWidget(
                          imgPath: AppAssets.homImgSix,
                          titleText: "Invite Friends",
                          subTitleText:
                              "Earn extra rock by inviting your friends.",
                          navigatorPath: TeamScreen.routeName,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "ACHIEVEMENTS",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularStepProgressIndicator(
                              totalSteps: 6,
                              currentStep: 1,
                              stepSize: 4.sp,
                              selectedColor: AppColors.green1,
                              unselectedColor: Colors.grey[200],
                              padding: 0,
                              width: 85.w,
                              height: 85.h,
                              selectedStepSize: 10.sp,
                              roundedCap: (_, __) => true,
                              unselectedStepSize: 8.sp,
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "1 ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontFamily: "Lato",
                                              fontSize: 17.sp,
                                              color: AppColors.blue2,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      TextSpan(
                                        text: "of ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontFamily: "Lato",
                                              fontSize: 17.sp,
                                              color: AppColors.blue2,
                                            ),
                                      ),
                                      TextSpan(
                                        text: "6",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontFamily: "Lato",
                                              fontSize: 17.sp,
                                              color: AppColors.blue2,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your progress",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: AppColors.blue2,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16.sp
                                      ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Complete the tasks below and level up!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                      color: AppColors.blue4,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      height: 18.h,
                                      width: 18.w,
                                      AppAssets.achiImg7,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      "1000 Rocks for each task",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                          color: AppColors.blue1,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          fontFamily: "Poppins",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SvgPicture.asset(AppAssets.achivementImgFive),
                        // SvgPicture.asset(
                        //   AppAssets.achivementImgSix,
                        //   fit: BoxFit.cover,
                        //   width: 470.w,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _pointsWidget extends StatelessWidget {
  const _pointsWidget({
    super.key,
    required this.imagaPath,
    required this.title,
    required this.value,
  });

  final String imagaPath, title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(imagaPath),
        const SizedBox(width: 8), // Add some space between the image and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.white1, fontWeight: FontWeight.w100),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.white1, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
