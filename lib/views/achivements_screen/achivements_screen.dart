import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/views/team_screen/team_screen.dart';
import 'package:rocki_poin_app/views/welcome_bonus/list_tile_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../core/constants/app_assets.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  static const routeName = "achievement";

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.center,
                height: 225.h,
                width: double.infinity,
                color: AppColors.blue1,
                child: SvgPicture.asset(
                  AppAssets.achiImgOne,
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 0.w,
                left: 0.w,
                bottom: -775.h,
                child: Container(
                  height: 800.h,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListTileWidget(
                        imgPath: AppAssets.homImgSix,
                        titleText: "Invite Friends",
                        subTitleText: "Earn extra rock by inviting your friends.",
                        navigatorPath: TeamScreen.routeName,
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "ACHIEVEMENTS",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularStepProgressIndicator(
                            totalSteps: 6,
                            currentStep: 1,
                            stepSize: 4.sp,
                            selectedColor: AppColors.green1,
                            unselectedColor: Colors.grey[200],
                            padding: 0,
                            width: 85.w,
                            height: 85.h,
                            selectedStepSize: 10.sp,
                            roundedCap: (_, __) => true,
                            unselectedStepSize: 8.sp,
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "1 ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                        fontFamily: "Lato",
                                        fontSize: 17.sp,
                                        color: AppColors.blue2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "of ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                        fontFamily: "Lato",
                                        fontSize: 17.sp,
                                        color: AppColors.blue2,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "6",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                        fontFamily: "Lato",
                                        fontSize: 17.sp,
                                        color: AppColors.blue2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your progress",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                  color: AppColors.blue2,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "Complete the tasks below and level up!",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                  color: AppColors.blue4,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
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
                                  SizedBox(width: 3.w),
                                  Text(
                                    "1000 Rocks for each task",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                      color: AppColors.blue1,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 250.h),
          Stepper(
            steps: [
              Step(
                isActive: _currentStep >= 0,
                state: _currentStep > 0
                    ? StepState.complete
                    : StepState.indexed,
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    height: 48.h,
                    width: 48.w,
                    AppAssets.achiImg8,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    "Claim your boneus",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.blue2,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                  subtitle: Text(
                    "Successfully registered.",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.blue4,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                content: Text(""),
              ),
              Step(
                isActive: _currentStep >= 1,
                state: _currentStep > 1
                    ? StepState.complete
                    : StepState.indexed,
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    height: 48.h,
                    width: 48.w,
                    AppAssets.achiImg9,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    "Rock Apps",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.grey3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                  subtitle: Text(
                    "Available on all devices.",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.lightBlue1,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                content: Text(""),
              ),
              Step(
                isActive: _currentStep >= 2,
                state: _currentStep > 2
                    ? StepState.complete
                    : StepState.indexed,
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    height: 48.h,
                    width: 48.w,
                    AppAssets.achiImg10,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    "Profile picture",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.grey3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                  subtitle: Text(
                    "Upload your profile image.",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.lightBlue1,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                content: Text(""),
              ),
              Step(
                isActive: _currentStep >= 3,
                state: _currentStep > 3
                    ? StepState.complete
                    : StepState.indexed,
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    height: 48.h,
                    width: 48.w,
                    AppAssets.achiImg11,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    "Follow us on Twitter",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.grey3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                  subtitle: Text(
                    "Let’s keep in touch, follow us on twitter.",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.lightBlue1,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                content: Text(""),
              ),
              Step(
                isActive: _currentStep >= 4,
                state: _currentStep > 4
                    ? StepState.complete
                    : StepState.indexed,
                title: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgPicture.asset(
                    height: 48.h,
                    width: 48.w,
                    AppAssets.achiImg12,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    "Join Telegram",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.grey3,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                  subtitle: Text(
                    "Be part of our community and join now.",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                      color: AppColors.lightBlue1,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                content: Text(""),
              ),
            ],
            onStepTapped: (int newIndex) {
              setState(() {
                _currentStep = newIndex;
              });
            },
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep != 4) {
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep != 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            controlsBuilder:
                (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: const Text('NEXT'),
                  ),
                  TextButton(
                    onPressed: details.onStepCancel,
                    child: const Text('BACK'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _pointsWidget extends StatelessWidget {
  const _pointsWidget({
    super.key,
    required this.imagaPath,
    required this.title,
    required this.value,
  });

  final String imagaPath, title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(imagaPath),
        const SizedBox(width: 8), // Add some space between the image and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.white1,
                    fontWeight: FontWeight.w100,
                  ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.white1,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
