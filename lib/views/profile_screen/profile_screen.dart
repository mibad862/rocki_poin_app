import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/views/profile_screen/widgets/user_details_widget.dart';
import 'package:rocki_poin_app/views/profile_screen/widgets/user_level_details.dart';

import '../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = "profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130.h,
            ),
            const UserDetailsWidget(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My LEVELS",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const MyLevelWidget(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My LEVELS",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "View All",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  // SvgPicture.asset(
                  //   AppAssets.profileImg7,
                  //   // height: 200.h,
                  //   width: 400.w,
                  //   fit: BoxFit.cover,
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyLevelWidget extends StatelessWidget {
  const MyLevelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.none,
      children: [
        Align(
            alignment: Alignment.center,
            child:
                SvgPicture.asset(fit: BoxFit.contain, AppAssets.profileImg3)),
        Positioned(
          right: 40.w,
          top: 14.h,
          child: Text(
            "28,450",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white1,
                ),
          ),
        ),
        Positioned(
          left: 64.w,
          top: 40.h,
          child: const userLevelDetailWidget(
            level: '1',
            titleone: '1M',
            titletwo: '5k',
            isLocked: false,
          ),
        ),
        Positioned(
          bottom: 10.h,
          left: 64.w,
          child: const userLevelDetailWidget(
            level: '2',
            titleone: '4M',
            titletwo: '25k',
            isLocked: true,
          ),
        )
      ],
    );
  }
}
