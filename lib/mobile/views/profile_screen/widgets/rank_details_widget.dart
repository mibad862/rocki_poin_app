import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class RankDetailsWidget extends StatelessWidget {
  const RankDetailsWidget({
    super.key,
    required this.imgPath,
    required this.downLines,
    required this.coin,
  });

  final String imgPath;
  final int downLines, coin;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.asset(
              height: 130.h,
              imgPath,
              fit: BoxFit.cover,
            ),
            SvgPicture.asset(
              AppAssets.profileImg10,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Starter",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "2 of 5",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$downLines Downlines",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "$coin Coins",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.green1,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

