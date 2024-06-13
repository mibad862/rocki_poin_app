import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/common_elevated_button.dart';
import '../../user_details/model/provider/user_provider.dart';

class UpgradeCount extends StatefulWidget {
  const UpgradeCount({super.key});

  @override
  State<UpgradeCount> createState() => _UpgradeCountState();
}

class _UpgradeCountState extends State<UpgradeCount> {

  String rocks = "Loading...";

  Future<void> _fetchCoins() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('user_email') ?? '';

      if (email.isEmpty) {
        setState(() {
          rocks = "No email found";
        });
        return;
      }

      DocumentReference userDoc =
      FirebaseFirestore.instance.collection('user_details').doc(email);

      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await userDoc.get() as DocumentSnapshot<Map<String, dynamic>>;

      if (!snapshot.exists) {
        setState(() {
          rocks = "User data not found";
        });
        return;
      }

      int currentCoins = snapshot.data()!['coin'] ?? 0;
      int currentLevel = snapshot.data()!['level'] ?? 1;

      if (currentCoins > 2000) {
        int updatedCoins = currentCoins - 2000;
        int updatedLevel = currentLevel + 1;

        await userDoc.update({
          'coin': updatedCoins,
          'level': updatedLevel,
        });

        _showAlertDialog('Upgraded Successfully');
      }

      print(currentCoins);
      print(currentLevel);

      if (currentCoins < 2000) {
        _showAlertDialog('Insufficient Coins');
      }
    } catch (e) {
      setState(() {
        rocks = "Error fetching data";
      });
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          fontSize: 15.sp,
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
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(0)),
                ),
                context: context,
                builder: (context) {
                  return Container(
                    height: 800.h,
                    padding: EdgeInsets.only(
                        bottom: 20.h,
                        top: 10.h,
                        right: 10.w,
                        left: 10.w),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
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
                            borderRadius:
                            BorderRadius.circular(15.0),
                            image: const DecorationImage(
                              image:
                              AssetImage(AppAssets.botImg3),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
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
                        SizedBox(height: 25.h),
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.botImg2,
                              width: 25.w,
                              height: 25.h,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "2,000",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blue1,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Text(
                              " / ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blue1,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Consumer<UserProvider>(
                              builder: (context, userProvider, child) {
                                final user = userProvider.user;
                                return Text(
                                  "level ${user?.level ?? '1'}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.grey5,
                                    fontFamily: "Poppins",
                                  ),
                                );
                              },
                            ),
                            // Text.rich(
                            //   TextSpan(
                            //     children: [
                            //       TextSpan(
                            //         text: "2,000",
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .titleSmall!
                            //             .copyWith(
                            //             fontSize: 25.sp,
                            //             fontWeight: FontWeight.w600,
                            //             color: AppColors.blue1,
                            //             fontFamily: "Poppins"),
                            //       ),
                            //       TextSpan(
                            //         text: " / ",
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .titleSmall!
                            //             .copyWith(
                            //           fontSize: 22.sp,
                            //           fontWeight: FontWeight.w600,
                            //           color: AppColors.grey5,
                            //         ),
                            //       ),
                            //       TextSpan(
                            //         text: "LEVEL ${user?.level ?? '1'}",
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .titleSmall!
                            //             .copyWith(
                            //             fontSize: 17.sp,
                            //             fontWeight: FontWeight.w600,
                            //             color: AppColors.grey5,
                            //             fontFamily: "Poppins"),
                            //       )
                            //     ],
                            //   ),
                            // )
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
                        SizedBox(height: 35.h),
                        CustomButton(
                          fontWeight: FontWeight.w600,
                          borderColor: AppColors.blue1,
                          fontFamily: "Poppins",
                          fontSize: 18.sp,
                          borderRadius: 15.0,
                          width: 310.w,
                          height: 60.h,
                          onPressed: _fetchCoins,
                          text: "Get it!",
                        ),
                        SizedBox(height: 20.h),
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
    );
  }
}
