import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';

import '../core/constants/app_assets.dart';

class CommonBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CommonBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 90.h,
      padding: EdgeInsets.only(bottom: 15.h),
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconBottomBar(
              text: "Home",
              imgPath: AppAssets.bottomNavBarImg1,
              selected: selectedIndex == 0,
              onPressed: () {
                onItemTapped(0);
              },
            ),
            IconBottomBar(
              text: "Ref",
              imgPath: AppAssets.bottomNavBarImg2,
              selected: selectedIndex == 1,
              onPressed: () {
                onItemTapped(1);
              },
            ),
            IconBottomBar(
              text: "Mine",
              imgPath: AppAssets.bottomNavBarImg3,
              selected: selectedIndex == 2,
              onPressed: () {
                onItemTapped(2);
              },
            ),
            IconBottomBar(
              text: "Levels",
              imgPath: AppAssets.bottomNavBarImg4,
              selected: selectedIndex == 3,
              onPressed: () {
                onItemTapped(3);
              },
            ),
            IconBottomBar(
              text: "Profile",
              imgPath: AppAssets.bottomNavBarImg5,
              selected: selectedIndex == 4,
              onPressed: () {
                onItemTapped(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    super.key,
    required this.text,
    required this.imgPath,
    required this.selected,
    required this.onPressed,
  });

  final String text;
  final String imgPath;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 3.0,
      child: Container(
        padding: EdgeInsets.only(bottom: 4.h),
        height: 85.h,
        width: 64.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onPressed,
              child: SvgPicture.asset(
                imgPath,
                fit: BoxFit.cover,
                width: 45.w,
                height: 45.h,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    height: 1.2,
                    color: selected ? AppColors.blue1 : AppColors.grey2,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
