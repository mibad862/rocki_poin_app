import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';

class SectionOneDesign extends StatelessWidget {
  const SectionOneDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
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
              SizedBox(width: 10.w),
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
                        fontWeight: FontWeight.w300,
                        fontFamily: "Lato"
                    ),
                  ),
                  Text(
                    "@elementalmaster",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white1),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/images/homImgTwo.svg',
                height: 42.h,
                width: 42.w,
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
    );
  }
}
