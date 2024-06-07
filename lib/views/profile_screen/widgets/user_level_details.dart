import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';

import '../../../core/constants/app_assets.dart';

class userLevelDetailWidget extends StatelessWidget {
  const userLevelDetailWidget(
      {super.key,
      required this.titleone,
      required this.titletwo,
      required this.level,
      required this.isLocked});

  final String titleone;
  final String titletwo, level;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              titleone,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white1,
                  ),
            ),
            Text(
              "Rocks",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColors.white1,
                  ),
            ),
          ],
        ),
        SvgPicture.asset(AppAssets.profileImg6),
        Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
              color: isLocked ? AppColors.white2 : AppColors.white1,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                level,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.blue2,
                    ),
              ),
              Text(
                'Level',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.blue3,
                    ),
              )
            ],
          ),
        ),
        SvgPicture.asset(AppAssets.profileImg6),
        Column(
          children: [
            Text(
              titletwo,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white1,
                  ),
            ),
            Text(
              "Rocks",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColors.white1,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
