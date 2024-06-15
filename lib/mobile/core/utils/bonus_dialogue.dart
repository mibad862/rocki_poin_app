import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';


void showBonusDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColors.white1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: 370.h,
          width: 600.w, // Set the desired width here

          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bonus header with icon
                Image.asset(
                  AppAssets.welImgThree,
                ),

                // 500 Coins text
                Text(
                  '500 Coins',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 33.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue1),
                ),
                const SizedBox(height: 10),
                // Congratulations text
                Text(
                  'Congratulations',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue2),
                ),
                const SizedBox(height: 10),
                // Description text
                Text(
                  'You have received your daily extra bonus.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.grey5),
                ),
                const SizedBox(height: 10),
                // Find out more button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/dashboard_img8.png'),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      'Find out more',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
  // Timer(Duration(seconds: 3), () {
  //   Navigator.of(context).pop();
  // });
}
