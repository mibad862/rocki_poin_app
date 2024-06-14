import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/mining_dashboard/provider/tap_counter.dart';
import 'package:rocki_poin_app/widgets/common_elevated_button.dart';

import 'widgets/upgrade_count.dart';

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
                  SizedBox(height: 10.h),
                  const UpgradeCount(),
                  SizedBox(height: 5.h),
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
                    // Add your claim logic here
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