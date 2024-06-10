import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rocki_poin_app/views/profile_screen/models/ref_task_model.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/common_elevated_button.dart';

class RefTaskWidget extends StatelessWidget {
  const RefTaskWidget({
    super.key,
    required this.item,
  });

  final RefTaskModel item;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.only(right: 12.w, top: 10.h),
        width: double.infinity,
        height: 105.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppAssets.profileImg11,
                  width: 62.w,
                  height: 62.h,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Invite ${item.totalNumber} Friends",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14.sp,
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            height: 18.h,
                            width: 18.w,
                            AppAssets.achiImg7,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            item.totalAmount,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 16.sp,
                                  fontFamily: "Poppins",
                                  color: AppColors.blue1,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: CustomButton(
                    textColor: AppColors.grey7,
                    borderColor: Colors.grey.shade400,
                    buttonColor: Colors.grey.shade400,
                    fontFamily: "Lato",
                    fontSize: 18.sp,
                    borderRadius: 15.0,
                    width: 70.w,
                    height: 40.h,
                    onPressed: () {},
                    text: "Claim",
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Container(
                padding: EdgeInsets.only(right: 180.w),
                width: double.infinity,
                height: 18.h,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                  height: 16.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColors.green2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
