import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';

class MiningDashboard extends StatelessWidget {
  const MiningDashboard({super.key});

  static const routName = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.blue1,
            height: 800.h,
            child: Column(
              children: [
                SizedBox(
                  height: 140.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mining Dashboard",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Connected",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green1.withOpacity(0.6)),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/dashboard_cover.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              left: 20.w,
                              top: 44.h,
                              child: SvgPicture.asset(
                                  AppAssets.dashboardImgThree)),
                          Positioned(
                            right: 10.w,
                            top: 40.h,
                            child: SvgPicture.asset(
                                height: 50.h, AppAssets.dashboardImgFour),
                          ),
                          Positioned(
                            left: 63.w,
                            top: 40.h,
                            child: Column(
                              children: [
                                Text(
                                  "Upgrade taps",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "2,000",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: ' Rocks',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/pngfind 1_prev_ui.png',
                              fit: BoxFit.cover,
                              color: AppColors.white1.withOpacity(0.6),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 150.h,
                            child: SvgPicture.asset(
                                height: 280.h, AppAssets.dashboardImgFive),
                          ),
                          SizedBox(
                            width: 800,
                            child: Image.asset(
                              AppAssets.dashboardImgSix,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
