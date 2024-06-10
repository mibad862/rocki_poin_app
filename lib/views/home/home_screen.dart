import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/team_screen/team_screen.dart';
import 'package:rocki_poin_app/views/welcome_bonus/list_tile_widget.dart';
import '../achivements_screen/achivements_screen.dart';
import '../welcome_bonus/team_design_widget.dart';
import '../welcome_bonus/team_model.dart';
import 'home_widgets/section_one_design.dart';
import 'home_widgets/section_two_design.dart';

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
              const SectionOneDesign(),
              // Positioned(
              //     bottom: 90.h,
              //     right: 0,
              //     left: 0,
              //     child: SvgPicture.asset(
              //       AppAssets.homImgSixteen,
              //       color: Colors.white,
              //       height: 10.h,
              //       fit: BoxFit.contain,
              //     )),
              Positioned(
                right: 0,
                left: 0,
                top: 195.h,
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
              const SectionTwoDesign(),
            ],
          ),
          SizedBox(height: 145.h),
          Column(
            children: [
              const ListTileWidget(
                imgPath: AppAssets.homImgFive,
                titleText: "Connect wallet",
                subTitleText: "Assign your wallet to app.",
                navigatorPath: TeamScreen.routeName,
              ),
              SizedBox(height: 25.h),
              const ListTileWidget(
                imgPath: AppAssets.homImgSix,
                titleText: "Invite Friends",
                subTitleText: "Earn extra rock from friends.",
                navigatorPath: TeamScreen.routeName,
              ),
            ],
          ).paddingHorizontal(18.w),
          SizedBox(height: 20.h),
          // Column(
          //   children: [
          //     Row(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           "TEAM",
          //           style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //                 fontSize: 22.sp,
          //                 fontWeight: FontWeight.w600,
          //                 color: AppColors.blue2,
          //               ),
          //         ),
          //         GestureDetector(
          //           onTap: () => Navigator.pushNamed(
          //             context,
          //             AchievementScreen.routeName,
          //           ),
          //           child: Text(
          //             "view team",
          //             style: Theme.of(context).textTheme.titleSmall!.copyWith(
          //                   fontSize: 18.sp,
          //                   fontWeight: FontWeight.w500,
          //                   color: AppColors.blue2,
          //                 ),
          //           ),
          //         ),
          //       ],
          //     ).paddingHorizontal(18.w),
          //     SizedBox(height: 15.h),
          //     Container(
          //       padding: EdgeInsets.only(left: 18.w),
          //       height: 100.h,
          //       child: ListView.separated(
          //         separatorBuilder: (context, index) => SizedBox(width: 15.w),
          //         scrollDirection: Axis.horizontal,
          //         itemCount: TeamModel.teamList.length,
          //         itemBuilder: (context, index) {
          //           final item = TeamModel.teamList[index];
          //           return TeamDesignWidget(
          //             item: item,
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

}
