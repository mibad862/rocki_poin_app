import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';

import '../../core/constants/app_assets.dart';
import '../welcome_bonus/list_tile_widget.dart';

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
                SizedBox(
                  height: 40.h,
                ),
                SvgPicture.asset(AppAssets.achivementImgOne),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const _pointsWidget(
                      imagaPath: AppAssets.achivementImgTwo,
                      title: "Referrals",
                      value: '139,205',
                    ),
                    SvgPicture.asset(
                      AppAssets.achivementImgFour,
                      fit: BoxFit.contain,
                    ),
                    const _pointsWidget(
                      imagaPath: AppAssets.achivementImgThree,
                      title: "Earnings",
                      value: '121,985. rock',
                    )
                  ],
                )
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
                          titleText: "Invitee Friends",
                          subTitleText:
                              "Earn extra rock by inviting your friends.",
                          navigatorPath: "",
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
                        SvgPicture.asset(AppAssets.achivementImgFive),
                        SizedBox(
                          height: 20.h,
                        ),
                        SvgPicture.asset(
                          AppAssets.achivementImgSix,
                          fit: BoxFit.cover,
                          width: 470.w,
                        )
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
