import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/achivements_screen/achivements_screen.dart';
import 'package:rocki_poin_app/views/welcome_bonus/list_tile_widget.dart';
import 'package:rocki_poin_app/views/welcome_bonus/team_design_widget.dart';
import 'package:rocki_poin_app/views/welcome_bonus/team_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15.w, right: 18.w, top: 5.h),
                width: double.infinity,
                height: 300.h,
                decoration: const BoxDecoration(
                  color: AppColors.blue1,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRyEK7weZZ3GssIBAJAmaruh1MS-FYpXbj4w&s'),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good evening,",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "elementalmaster",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/homImgTwo.svg',
                          height: 40.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "REFERRALS",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w200,
                                    color: AppColors.white2,
                                  ),
                            ),
                            Text(
                              "530",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white1,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "TOTAL MINIERS",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w200,
                                    color: AppColors.white2,
                                  ),
                            ),
                            Text(
                              "950.345",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white1,
                                  ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "PLAYERS",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w200,
                                    color: AppColors.white2,
                                  ),
                            ),
                            Text(
                              "58,975",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white1,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 80.h,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    AppAssets.homImgSixteen,
                    // color: Colors.white,
                    height: 10.h,
                    fit: BoxFit.contain,
                  )),
              Positioned(
                right: 0,
                left: 0,
                top: 220.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 220.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        // color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage(
                            AppAssets.homImgThree,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10.w,
                bottom: -110.h,
                child: Container(
                  padding: EdgeInsets.only(bottom: 25.h),
                  alignment: Alignment.bottomCenter,
                  width: 370.w,
                  height: 158.h,
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(18.0),
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/home_screen_img_cover.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset(
                                'assets/images/homImgTwo.svg',
                                height: 20.h,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "CURRENT BALANCE",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white1,
                                    ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "LEVEL 1",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white1,
                                    ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ],
                      ),
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
              ),
            ],
          ),
          SizedBox(height: 150.h),
          Column(
            children: [
              const ListTileWidget(
                imgPath: AppAssets.homImgFive,
                titleText: "Connect wallet",
                subTitleText: "Assign your wallet to your mining app.",
                navigatorPath: AchievementScreen.routeName,
              ),
              SizedBox(height: 25.h),
              const ListTileWidget(
                imgPath: AppAssets.homImgSix,
                titleText: "Invitee Friends",
                subTitleText: "Earn extra rock by inviting your friends.",
                navigatorPath: AchievementScreen.routeName,
              ),
            ],
          ).paddingHorizontal(18.w),
          SizedBox(height: 20.h),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TEAM",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blue2,
                        ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, AchievementScreen.routeName),
                    child: Text(
                      "view team",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blue2,
                          ),
                    ),
                  ),
                ],
              ).paddingHorizontal(18.w),
              SizedBox(height: 15.h),
              Container(
                padding: EdgeInsets.only(left: 18.w),
                height: 100.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 15.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: TeamModel.teamList.length,
                  itemBuilder: (context, index) {
                    final item = TeamModel.teamList[index];
                    return TeamDesignWidget(
                      item: item,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
