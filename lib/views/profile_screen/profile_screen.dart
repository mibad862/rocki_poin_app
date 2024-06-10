import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/views/mining_dashboard/mining_dashboard.dart';
import 'package:rocki_poin_app/views/profile_screen/models/ref_task_model.dart';
import 'package:rocki_poin_app/views/profile_screen/widgets/my_level_widget.dart';
import 'package:rocki_poin_app/views/profile_screen/widgets/ref_task_widget.dart';
import 'package:rocki_poin_app/views/profile_screen/widgets/user_details_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = "profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 110.h),
            const UserDetailsWidget(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        "MY RANKS",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const MyLevelWidget(),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "REF TASK",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "More",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 350.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      itemCount: RefTaskModel.refTaskList.length,
                      itemBuilder: (context, index) {
                        final item = RefTaskModel.refTaskList[index];
                        return RefTaskWidget(
                          item: item,
                        );
                      },
                    ),
                  ),
                  // Material(
                  //   elevation: 2.0,
                  //     borderRadius: BorderRadius.circular(15.0),
                  //   child: Container(
                  //     padding: EdgeInsets.only(right: 12.w, top: 10.h),
                  //     width: double.infinity,
                  //     height: 105.h,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15.0)
                  //     ),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Row(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             SvgPicture.asset(
                  //               AppAssets.profileImg11,
                  //               width: 62.w,
                  //               height: 62.h,
                  //               fit: BoxFit.cover,
                  //             ),
                  //             Align(
                  //               alignment: Alignment.center,
                  //               child: Column(
                  //                 mainAxisSize: MainAxisSize.min,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     "Invite 10 Friends",
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .labelMedium!
                  //                         .copyWith(
                  //                           fontSize: 14.sp,
                  //                           fontFamily: "Poppins",
                  //                           color: Colors.black,
                  //                           fontWeight: FontWeight.w600,
                  //                         ),
                  //                   ),
                  //                   SizedBox(height: 2.h),
                  //                   Row(
                  //                     mainAxisSize: MainAxisSize.min,
                  //                     children: [
                  //                       SvgPicture.asset(
                  //                         height: 18.h,
                  //                         width: 18.w,
                  //                         AppAssets.achiImg7,
                  //                         fit: BoxFit.contain,
                  //                       ),
                  //                       SizedBox(width: 5.w),
                  //                       Text(
                  //                         "20,000",
                  //                         style: Theme.of(context)
                  //                             .textTheme
                  //                             .labelMedium!
                  //                             .copyWith(
                  //                               fontSize: 16.sp,
                  //                               fontFamily: "Poppins",
                  //                               color: AppColors.blue1,
                  //                               fontWeight: FontWeight.w500,
                  //                             ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Spacer(),
                  //             Align(
                  //               alignment: Alignment.topRight,
                  //               child: CustomButton(
                  //                 textColor: AppColors.grey7,
                  //                 borderColor: Colors.grey.shade400,
                  //                 buttonColor: Colors.grey.shade400,
                  //                 fontFamily: "Lato",
                  //                 fontSize: 18.sp,
                  //                 borderRadius: 15.0,
                  //                 width: 70.w,
                  //                 height: 40.h,
                  //                 onPressed: (){},
                  //                 text: "Claim",
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.only(left: 12.w),
                  //           child: Container(
                  //             padding: EdgeInsets.only(right: 180.w),
                  //             width: double.infinity,
                  //             height: 18.h,
                  //             decoration: BoxDecoration(
                  //               color: Colors.grey.shade400,
                  //               borderRadius: BorderRadius.circular(20.0)
                  //             ),
                  //             child: Container(
                  //               height: 16.h,
                  //               decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(20.0),
                  //                   color: AppColors.green2,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       const RankDetailsWidget(
                  //         ImgPath: AppAssets.profileImg9,
                  //         coin: 500,
                  //         downlines: 15,
                  //       ),
                  //       SizedBox(
                  //         width: 10.w,
                  //       ),
                  //       const RankDetailsWidget(
                  //         ImgPath: AppAssets.profileImg8,
                  //         coin: 1000,
                  //         downlines: 35,
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
