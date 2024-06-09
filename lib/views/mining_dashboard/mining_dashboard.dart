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
                  height: 100.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                          SizedBox(
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
                    ],
                  ),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/pngfind 1_prev_ui.png',
                        fit: BoxFit.cover,
                        color: AppColors.white1.withOpacity(0.6),
                      ),
                    ),
                    Positioned(
                      left: 40.w,
                      right: 0,
                      top: 120.h,
                      child: SvgPicture.asset(
                          height: 280.h, AppAssets.dashboardImgFive),
                    ),
                    Positioned(
                      top: 260.h,
                      child: SizedBox(
                        width: 414.w,
                        child: SvgPicture.asset(
                          fit: BoxFit.cover,
                          AppAssets.dashboardImgSix,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400.h,
                      left: 60.w,
                      child: SizedBox(
                          child: Column(
                        children: [
                          Text(
                            '8h :00.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          SizedBox(
                            width: 300.w,
                            height: 59.h,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            AppColors.grey4)),
                                onPressed: () {},
                                child: Text(
                                  "Claim",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white),
                                )),
                          )
                        ],
                      )),
                    ),
                  ],
                )
              ],
            ))
      ],
    ));
  }
}
