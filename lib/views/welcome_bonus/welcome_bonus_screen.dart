import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/home_screen.dart';
import 'package:rocki_poin_app/widgets/common_elevated_button.dart';
import '../../core/constants/app_assets.dart';

class WelcomeBonusScreen extends StatelessWidget {
  const WelcomeBonusScreen({super.key});

  static const routeName = "/welcome-bonus";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildStack(context),
          SizedBox(height: 40.h),
          _buildContainer(context),
          SizedBox(height: 100.h),
          CommonElevatedButton(
            fontSize: 18.sp,
            width: 310.w,
            height: 60.h,
            onPressed: () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
            text: "OK",
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          height: 80.h,
          width: 310.w,
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "YOUR CURRENT BALANCE",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "500. ",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 30.sp, fontWeight: FontWeight.w600),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.bottom,
                      child: Text(
                        "00",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextSpan(
                      text: " Rock",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 25.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }

  Widget _buildStack(BuildContext context) {
    return Stack(
          children: [
            Image.asset(
              AppAssets.welImgOne,
              height: 483.h,
              width: 483.w,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 110.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome bonus",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontSize: 32.sp, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: 45.w),
                      Image.asset(
                        AppAssets.welImgTwo,
                        height: 75.h,
                        width: 75.w,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Congratulations, you have received\nyour first 500 rock coins",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 13.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ).paddingHorizontal(20.w),
            ),
            Positioned(
              bottom: 0.h,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAssets.welImgThree,
                height: 200.h,
                width: 200.w,
              ),
            ),
          ],
        );
  }
}
