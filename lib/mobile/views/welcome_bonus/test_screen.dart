import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../home_screen_widget.dart';
import 'team_design_widget.dart';
import 'team_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        // margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 18.w),
              height: 100.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                scrollDirection: Axis.horizontal,
                itemCount: TeamModel.teamList.length,
                itemBuilder: (context, index) {
                  final item = TeamModel.teamList[index];
                  return TeamDesignWidget(
                    item: item,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(bottom: 25.h),
              alignment: Alignment.bottomCenter,
              width: 350.w,
              height: 158.h,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(18.0),
                image: DecorationImage(
                  image: AssetImage(AppAssets.homImgFourteen),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppAssets.homImgFifteen,
                        height: 30.h,
                        width: 30.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "25,589 M",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.blue1,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "EARNING RATE",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white1,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "+500/500",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.green1,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "rock",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            const HomeScreenWidget(widget: Text("dsd")),
          ],
        ),
      ),
    );
  }
}


