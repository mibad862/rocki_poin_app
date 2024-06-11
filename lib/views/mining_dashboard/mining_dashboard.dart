import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/mining_dashboard/provider/tap_counter.dart';
import 'package:rocki_poin_app/widgets/common_elevated_button.dart';

class MiningDashboard extends StatefulWidget {
  const MiningDashboard({super.key});

  static const routeName = "dashboard";

  @override
  MiningDashboardState createState() => MiningDashboardState();
}

class MiningDashboardState extends State<MiningDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;
  Duration _remainingTime = const Duration(hours: 8);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _handleTap() {
    Provider.of<TapCounter>(context, listen: false).incrementTap();
    _controller.forward();
  }

  String _formattedTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h),
              color: AppColors.blue1,
              height: 550.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Mining Dashboard",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ).paddingHorizontal(15.w),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.center,
                    child: Consumer<TapCounter>(
                      builder: (context, tapCounter, child) {
                        return Text(
                          tapCounter.statusText,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green1.withOpacity(0.6)),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    width: double.infinity,
                    height: 79.h,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AppAssets.dashboardImgThree,
                          width: 35.w,
                          height: 35.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Upgrade counts",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "2,000",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                  ),
                                  const TextSpan(text: " "),
                                  TextSpan(
                                    text: 'rocks',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.vertical(top: Radius.circular(0)),
                              ),
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.only(bottom: 10.h, top: 10.h, right: 10.w, left: 10.w),
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: Icon(Icons.close),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 100.w,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                            image: AssetImage(AppAssets.botImg3),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 19.h),
                                      Text("Earning Rate",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                            fontSize: 25.sp,
                                            color: AppColors.blue2,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w700,
                                          )),
                                      SizedBox(height: 15.h),
                                      Text(
                                          "Increase the earning rate.\n+500 coins for each level.",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                            fontSize: 15.sp,
                                            color: AppColors.blue2,
                                            fontFamily: "Lato",
                                            fontWeight: FontWeight.w400,
                                          )),
                                      SizedBox(height: 40.h),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            AppAssets.botImg2,
                                            width: 25.w,
                                            height: 25.h,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(width: 5.w),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "2,000",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                      fontSize: 25.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: AppColors.blue1,
                                                      fontFamily: "Poppins"),
                                                ),
                                                TextSpan(
                                                  text: " / ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.grey5,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'level 1',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: AppColors.grey5,
                                                      fontFamily: "Poppins"),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.info_outlined,
                                            color: AppColors.blue1,
                                            size: 20.sp,
                                          ),
                                          SizedBox(width: 5.w),
                                          Text("Find out more",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                fontSize: 18.sp,
                                                color: AppColors.blue1,
                                                fontFamily: "Lato",
                                                fontWeight: FontWeight.w500,
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 40.h),
                                      CustomButton(
                                        fontWeight: FontWeight.w600,
                                        borderColor: AppColors.blue1,
                                        fontFamily: "Poppins",
                                        fontSize: 18.sp,
                                        borderRadius: 15.0,
                                        width: 310.w,
                                        height: 60.h,
                                        onPressed: () {},
                                        text: "Get it!",
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            AppAssets.dashboardImgFour,
                            width: 65.w,
                            height: 65.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/pngfind 1_prev_ui.png',
                          fit: BoxFit.cover,
                          color: AppColors.white1.withOpacity(0.6),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 100.h,
                        child: GestureDetector(
                          onTap: _handleTap,
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: 1 + (_animation.value * 0.1),
                                child: child,
                              );
                            },
                            child: SvgPicture.asset(
                              height: 280.h,
                              AppAssets.dashboardImgFive,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 260.h,
                        child: SvgPicture.asset(
                          width: 305.w,
                          height: 305.h,
                          fit: BoxFit.contain,
                          AppAssets.dashboardImgSix,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _formattedTime(_remainingTime),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(height: 20.h),
                // SizedBox(
                //   width: 300.w,
                //   height: 59.h,
                //   child: ElevatedButton(
                //       style: ButtonStyle(
                //           shape: MaterialStatePropertyAll(
                //               RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(10))),
                //           backgroundColor:
                //               const MaterialStatePropertyAll(AppColors.grey4)),
                //       onPressed: () {
                //         showModalBottomSheet(
                //           context: context,
                //           builder: (context) {
                //             return SizedBox(
                //               height: 200,
                //               child: Center(
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: const <Widget>[
                //                     Text('GeeksforGeeks'),
                //                   ],
                //                 ),
                //               ),
                //             );
                //           },
                //         );
                //       },
                //       child: Text(
                //         "Claim",
                //         style: Theme.of(context).textTheme.titleSmall!.copyWith(
                //             fontSize: 20.sp,
                //             fontWeight: FontWeight.w100,
                //             color: Colors.white),
                //       )),
                // )
                CustomButton(
                  fontWeight: FontWeight.w600,
                  borderRadius: 15.0,
                  fontSize: 18.sp,
                  fontFamily: "Poppins",
                  width: 320.w,
                  height: 60.h,
                  buttonColor: AppColors.grey4,
                  borderColor: AppColors.grey4,
                  textColor: AppColors.white1,
                  onPressed: () {

                  },
                  text: "Claim",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
