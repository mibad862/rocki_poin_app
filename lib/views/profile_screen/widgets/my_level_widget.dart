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
          child: SvgPicture.asset(
            fit: BoxFit.contain,
            AppAssets.profileImg3,
          ),
        ),
        Positioned(
          right: 44.w,
          top: 15.h,
          child: Text(
            "28,450",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white1,
                ),
          ),
        ),
        Positioned(
          left: 75.w,
          top: 47.h,
          child: Column(
            children: [
              const UserLevelDetailWidget(
                level: '1',
                titleOne: '1M',
                titleTwo: '5k',
                isLocked: false,
              ),
              SizedBox(height: 5.h),
              const UserLevelDetailWidget(
                level: '2',
                titleOne: '4M',
                titleTwo: '25k',
                isLocked: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
