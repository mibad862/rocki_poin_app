import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rocki_poin_app/views/profile_screen/profile_screen.dart';
import 'package:rocki_poin_app/views/welcome_bonus/list_tile_widget.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  static const routeName = "team-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230.h,
            width: double.infinity,
            color: AppColors.blue1,
            child: Stack(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SvgPicture.asset(
                  AppAssets.teamscreenImgOne,
                  fit: BoxFit.contain,
                ),
                // SizedBox(
                //   height: 10.h,
                // ),
                Positioned(
                  bottom: 40.h,
                  left: 20.w,
                  right: 20.w,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for users',
                      hintStyle: const TextStyle(color: Colors.black),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
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
                      color: Color(0XFFFFFFDFD),
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
                          subTitleText: "Earn extra rock from friends.",
                          navigatorPath: ProfileScreen.routeName,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SvgPicture.asset(
                          AppAssets.teamscreenImgTwo,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TeamWidget(),
                        SizedBox(
                          height: 5.h,
                        ),
                        TeamWidget(),
                        SizedBox(
                          height: 5.h,
                        ),
                        TeamWidget(),
                        SizedBox(
                          height: 5.h,
                        ),
                        TeamWidget(),
                        SizedBox(
                          height: 5.h,
                        ),
                        TeamWidget()
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

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 03.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/images/team_screen_avatar.png',
                          height: 60.h,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                            right: 0,
                            bottom: 1.h,
                            child: SvgPicture.asset(
                                'assets/images/team_screen_online.svg'))
                      ],
                    ))),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Multitap",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.teamscreenImgFour),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      "200",
                      style: TextStyle(color: Color(0XFF1B47C3)),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text("Coins"),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text("|"),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      "Starter",
                      style: TextStyle(color: Color(0XFF8F8F8F)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 80.w,
            ),
            SvgPicture.asset(AppAssets.teamscreenImgFive)
          ],
        ),
      ),
    );
  }
}
