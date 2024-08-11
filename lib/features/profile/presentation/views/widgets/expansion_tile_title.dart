
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';

class ExpansionTileTitle extends StatelessWidget {
  const ExpansionTileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 33,
          backgroundColor: AppColors.green50,
          child: SvgPicture.asset(
            AppImages.order,
            height: 32.h,
            width: 32.w,
          ),
        ),
        const HorizontalSpace(16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'طلباتي',
              style: AppStyles.textStyle13B.copyWith(color: Colors.black),
            ),
            Text(
              'طلباتي',
              style:
                  AppStyles.textStyle11R.copyWith(color: AppColors.gray400),
            ),
            const VerticalSpace(6),
            Row(
              children: [
                Text(
                  'طلباتي',
                  style: AppStyles.textStyle13R
                      .copyWith(color: AppColors.gray400),
                ),
                HorizontalSpace(10),
                Text(
                  '10',
                  style: AppStyles.textStyle13B,
                ),
                HorizontalSpace(16),
                Text(
                  '250 EGP',
                  style: AppStyles.textStyle13B,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
