import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';

import '../../widgets/common_elevated_button.dart';

void showExpireBonusDialog(BuildContext context) {
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bonus header with icon
                Image.asset(
                  AppAssets.welImgThree,
                ),

                // Expired text
                Text(
                  'Bonus Expired',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue2),
                ),
                SizedBox(height: 10.h),
                // Description text
                Text(
                  'Unfortunately, today/s bonus has expired. Stay tuned for the next notification!.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.grey5),
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 20.h),

                CustomButton(
                    height: 50.h,
                    width: 300.w,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Close')
              ],
            ),
          ),
        ),
      );
    },
  );
}
