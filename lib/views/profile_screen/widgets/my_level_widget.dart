import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/views/profile_screen/widgets/user_level_details.dart';

import '../../../core/constants/app_assets.dart';


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
