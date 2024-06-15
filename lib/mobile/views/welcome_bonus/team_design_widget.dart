import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import 'team_model.dart';

class TeamDesignWidget extends StatelessWidget {
  const TeamDesignWidget({super.key, required this.item});

  final TeamModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          height: 65.h,
          width: 65.w,
          item.imgPath,
          fit: BoxFit.contain,
        ),
        Text(
          item.imgText,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.grey1,
              ),
        ),
      ],
    );
  }
}
