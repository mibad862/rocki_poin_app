import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 180.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            image: DecorationImage(
              image: AssetImage(AppAssets.profileCoverImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Text(
                "@johnnyknox07",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white1,
                    ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildColumn(context, "GLOBAL FARMERS", "99,999,999"),
                  _buildColumn(context, "REFERRALS", "34"),
                  _buildColumn(context, "LEVEL", "2"),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -60.h,
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.white1, width: 4.w),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              image: const DecorationImage(
                image: AssetImage(AppAssets.profileImg2),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildColumn(BuildContext context, String text1, String text2) {
    return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w200,
                            color: AppColors.white2,
                            fontFamily: "Lato",
                          ),
                    ),
                    Text(
                      text2,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white1,
                            fontFamily: "Lato",
                          ),
                    ),
                  ],
                );
  }
}
