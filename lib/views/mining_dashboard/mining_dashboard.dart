import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/mining_dashboard/provider/tap_counter.dart';
import 'package:rocki_poin_app/widgets/common_elevated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/upgrade_count.dart';

class MiningDashboard extends StatefulWidget {
  const MiningDashboard({Key? key}) : super(key: key);

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
  late DateTime _lastClaimTime;

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

    _loadLastClaimTime(); // Load last claim time
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Calculate time since last claim
        DateTime now = DateTime.now();
        Duration timeSinceLastClaim = now.difference(_lastClaimTime);
        Duration remainingTime;

        if (timeSinceLastClaim < const Duration(hours: 8)) {
          remainingTime = const Duration(hours: 8) - timeSinceLastClaim;
        } else {
          remainingTime = const Duration();
        }

        _remainingTime = remainingTime;
      });
    });
  }

  void _loadLastClaimTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int lastClaimTimestamp = prefs.getInt('last_claim_timestamp') ?? 0;
    _lastClaimTime = DateTime.fromMillisecondsSinceEpoch(lastClaimTimestamp);
  }

  void _saveLastClaimTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('last_claim_timestamp', DateTime.now().millisecondsSinceEpoch);
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

  void _claimCoins() async {
    // Check if enough time has passed since last claim
    DateTime now = DateTime.now();
    Duration timeSinceLastClaim = now.difference(_lastClaimTime);
    if (timeSinceLastClaim.inHours < 8) {
      int hoursToWait = 8 - timeSinceLastClaim.inHours;
      _showAlertDialog('Please wait $hoursToWait hours before claiming again.');
      return;
    }

    int coinsToAdd = 0;

    // Get user level from SharedPreferences or wherever it's stored
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userLevel = prefs.getInt('user_level') ?? 1;

    // Determine coins to add based on user level
    if (userLevel == 1) {
      coinsToAdd = 1000;
    } else if (userLevel > 1) {
      coinsToAdd = 1500;
    }

    // Update coins in Firestore
    String userId = prefs.getString('userId') ?? '';
    if (userId.isNotEmpty) {
      DocumentReference<Map<String, dynamic>> userRef =
          FirebaseFirestore.instance.collection('rocks').doc(userId);
      try {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await userRef.get() as DocumentSnapshot<Map<String, dynamic>>;
        if (snapshot.exists) {
          int currentCoins = snapshot.data()?['coin'] ?? 0;
          int updatedCoins = currentCoins + coinsToAdd;

          await userRef.update({
            'coin': updatedCoins,
          });

          _saveLastClaimTime(); // Save current claim time

          _showAlertDialog('Coins claimed successfully: +$coinsToAdd coins');
        } else {
          _showAlertDialog('User data not found');
        }
      } catch (error) {
        print('Error claiming coins: $error');
        _showAlertDialog('Failed to claim coins. Please try again.');
      }
    } else {
      _showAlertDialog('User email not found. Please login again.');
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Claim Result"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
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
                    _claimCoins();
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
