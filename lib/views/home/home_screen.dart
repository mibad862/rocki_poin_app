import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rocki_poin_app/core/constants/app_assets.dart';
import 'package:rocki_poin_app/core/constants/app_colors.dart';
import 'package:rocki_poin_app/core/utils/bonus_dialogue.dart';
import 'package:rocki_poin_app/core/utils/padding_extensions.dart';
import 'package:rocki_poin_app/views/achivements_screen/achivements_screen.dart';
import 'package:rocki_poin_app/views/mining_dashboard/mining_dashboard.dart';
import 'package:rocki_poin_app/views/user_details/model/provider/user_provider.dart';
import 'package:rocki_poin_app/views/welcome_bonus/list_tile_widget.dart';

final _logger = Logger('HomeScreen');

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      //final userService = UserService();

      // Fetch email from shared preferences
      //final userEmail = await userService.getUserEmailFromPrefs();

      // if (userEmail != null) {
      //   final userProvider = Provider.of<UserProvider>(context, listen: false);
      //   userProvider
      //       .fetchUserData(userEmail); // Fetch user data using retrieved email
      // }

      showBonusDialog(context);
    });

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(
            body: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final user = userProvider.user;
                final balance = userProvider.balance ?? 0;
                final level = userProvider.level ?? 1;
                return ListView(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 18.w, top: 15.h),
                          width: double.infinity,
                          height: 300.h,
                          decoration: const BoxDecoration(
                            color: AppColors.blue1,
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                    width: 60.w,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(user
                                              ?.imageUrl ??
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRKgUUpHpc-JwcJiRLScAepL-T3oeaxR8T5A&s'),
                                      radius: 40.w,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Good evening,",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Text(
                                        user?.firstName ?? 'User name',
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
                                  const Spacer(),
                                  SvgPicture.asset(
                                    'assets/images/homImgnewTwo.svg',
                                    height: 40.h,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              SizedBox(height: 48.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "REFERRALS",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w200,
                                                  color: AppColors.white2,
                                                ),
                                          ),
                                          Text(
                                            "530",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.white1,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "TOTAL MINIERS",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w200,
                                                  color: AppColors.white2,
                                                ),
                                          ),
                                          Text(
                                            "950.345",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.white1,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "PLAYERS",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w200,
                                                  color: AppColors.white2,
                                                ),
                                          ),
                                          Text(
                                            "58,975",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.white1,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12.h),
                                  SvgPicture.asset(
                                    AppAssets.homImgSixteen,
                                    height: 10.h,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          top: 195.h,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 220.h,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.homImgThree),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10.w,
                          bottom: -90.h,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 25.h),
                            alignment: Alignment.bottomCenter,
                            width: 370.w,
                            height: 158.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/home_screen_img_cover.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 5.w),
                                        SvgPicture.asset(
                                          'assets/images/homImgTwo.svg',
                                          height: 20.h,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          "CURRENT BALANCE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white1,
                                              ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "LEVEL $level",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white1,
                                              ),
                                        ),
                                        SizedBox(width: 15.w),
                                      ],
                                    ),
                                  ],
                                ),
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
                                      "$balance",
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.blue1,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Earning Rate",
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
                                        "1,000 8hrs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.green1,
                                            ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        "Rock",
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 150.h),
                    Column(
                      children: [
                        const ListTileWidget(
                          imgPath: AppAssets.homImgFive,
                          titleText: "Connect wallet",
                          subTitleText: "Assign your wallet to app.",
                          navigatorPath: AchievementScreen.routeName,
                        ),
                        SizedBox(height: 25.h),
                        const ListTileWidget(
                          imgPath: AppAssets.homImgSix,
                          titleText: "Invite Friends",
                          subTitleText: "Earn extra rock from friends.",
                          navigatorPath: MiningDashboard.routeName,
                        ),
                      ],
                    ).paddingHorizontal(18.w),
                    SizedBox(height: 20.h),
                  ],
                );
              },
            ),
          );
        } else {
          return Scaffold(
            body: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final user = userProvider.user;
                final balance = userProvider.balance ?? 0;
                final level = userProvider.level ?? 1;
                return ListView(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.015,
                              right: screenWidth * 0.015,
                              top: screenHeight * 0.010),
                          width: double.infinity,
                          height: 300.h,
                          decoration: const BoxDecoration(
                            color: AppColors.blue1,
                          ),
                          child: Column(
                            children: [
                              // SizedBox(height: 10.h),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      user?.imageUrl ??
                                          'https://w7.pngwing.com/pngs/195/539/png-transparent-account-user-person-profile-people-outline-style-icon-thumbnail.png',
                                    ),
                                    radius: screenWidth * 0.035,
                                  ),
                                  SizedBox(width: screenWidth * 0.010),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Good evening,",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.022,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Text(
                                        user?.firstName ?? 'User name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.022,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white1,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    'assets/images/homImgnewTwo.svg',
                                    height: screenHeight * 0.040,
                                    width: screenWidth * 0.040,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.070),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "REFERRALS",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.024,
                                              fontWeight: FontWeight.w200,
                                              color: AppColors.white2,
                                            ),
                                      ),
                                      Text(
                                        "530",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.042,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white1,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "TOTAL MINIERS",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.024,
                                              fontWeight: FontWeight.w200,
                                              color: AppColors.white2,
                                            ),
                                      ),
                                      Text(
                                        "950.345",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.042,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white1,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "PLAYERS",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.024,
                                              fontWeight: FontWeight.w200,
                                              color: AppColors.white2,
                                            ),
                                      ),
                                      Text(
                                        "58,975",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.042,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white1,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.018),
                              SvgPicture.asset(
                                AppAssets.homImgSixteen,
                                height: 10.h,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          top: screenHeight * 0.265,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: screenHeight * 0.240,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppAssets.homImgThree),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: -screenHeight * 0.150,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.045),
                            padding: EdgeInsets.only(
                                bottom: screenHeight * 0.025,
                                right: screenWidth * 0.015,
                                left: screenWidth * 0.015),
                            alignment: Alignment.bottomCenter,
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/home_screen_img_cover.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/homImgTwo.svg',
                                          height: screenHeight * 0.030,
                                          width: screenWidth * 0.030,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: screenWidth * 0.002),
                                        Text(
                                          "CURRENT BALANCE",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontFamily: "Lato",
                                                fontSize: screenWidth * 0.022,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.white1,
                                              ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "LEVEL $level",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontFamily: "Lato",
                                            fontSize: screenWidth * 0.022,
                                            fontWeight: FontWeight.w800,
                                            color: AppColors.white1,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      AppAssets.homImgFifteen,
                                      height: screenHeight * 0.040,
                                      width: screenWidth * 0.040,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: screenWidth * 0.005),
                                    Text(
                                      "$balance",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            fontFamily: "Lato",
                                            fontSize: screenWidth * 0.050,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.white1,
                                          ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.025),
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.blue1,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Earning Rate",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontFamily: "Lato",
                                              fontSize: screenWidth * 0.024,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white1,
                                            ),
                                      ),
                                      SizedBox(width: screenWidth * 0.010),
                                      Text(
                                        "1,000 8hrs",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.028,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.green1,
                                            ),
                                      ),
                                      SizedBox(width: screenWidth * 0.010),
                                      Text(
                                        "Rock",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              fontSize: screenWidth * 0.028,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.white1,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.220),
                    Column(
                      children: [
                        const ListTileWidget(
                          imgPath: AppAssets.homImgFive,
                          titleText: "Connect wallet",
                          subTitleText: "Assign your wallet to app.",
                          navigatorPath: AchievementScreen.routeName,
                        ),
                        SizedBox(height: 25.h),
                        const ListTileWidget(
                          imgPath: AppAssets.homImgSix,
                          titleText: "Invite Friends",
                          subTitleText: "Earn extra rock from friends.",
                          navigatorPath: MiningDashboard.routeName,
                        ),
                      ],
                    ).paddingHorizontal(18.w),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
