import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rocki_poin_app/views/welcome_bonus/team_model.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';

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
          item.imgPath,
          width: 75.w,
          height: 75.h,
          fit: BoxFit.contain,
        ),
        Text(
          item.imgText,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.grey1,
          ),
        ),
      ],
    );
  }
}
