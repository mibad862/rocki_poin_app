import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/views/mining_dashboard/provider/tap_counter.dart';

class MiningDashboard extends StatefulWidget {
  const MiningDashboard({super.key});

  static const routName = "dashboard";

  @override
  _MiningDashboardState createState() => _MiningDashboardState();
}

class _MiningDashboardState extends State<MiningDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;
  Duration _remainingTime = Duration(hours: 8);

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
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
              color: AppColors.blue1,
              height: 800.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mining Dashboard",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                        ),
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
                                        color:
                                            AppColors.green1.withOpacity(0.6)),
                              );
                            },
                          ),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/dashboard_cover.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                left: 20.w,
                                top: 44.h,
                                child: SvgPicture.asset(
                                    AppAssets.dashboardImgThree)),
                            Positioned(
                              right: 10.w,
                              top: 40.h,
                              child: SvgPicture.asset(
                                  height: 50.h, AppAssets.dashboardImgFour),
                            ),
                            Positioned(
                              left: 63.w,
                              top: 40.h,
                              child: Column(
                                children: [
                                  Text(
                                    "Upgrade taps",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w100,
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
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                        ),
                                        TextSpan(
                                          text: ' Rocks',
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
                            ),
                          ],
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
                        left: 40.w,
                        right: 0,
                        top: 90.h,
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
                        top: 240.h,
                        child: SizedBox(
                          width: 414.w,
                          child: SvgPicture.asset(
                            fit: BoxFit.cover,
                            AppAssets.dashboardImgSix,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 365.h,
                        left: 60.w,
                        child: SizedBox(
                            child: Column(
                          children: [
                            Text(
                              _formattedTime(_remainingTime),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              width: 300.w,
                              height: 59.h,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              AppColors.grey4)),
                                  onPressed: () {
                                    print("HELLO");
                                  },
                                  child: Text(
                                    "Claim",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white),
                                  )),
                            )
                          ],
                        )),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
