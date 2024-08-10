
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class HeaderSectionBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                S.of(context).filter,
                style:
                    AppStyles.textStyle19B.copyWith(color: AppColors.gray950),
              ),
            ],
          ),
      const    VerticalSpace(19),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.filter_specific_icon,
              ),
              HorizontalSpace(8),
              Text(
                S.of(context).priceRange,
                style:
                    AppStyles.textStyle13B.copyWith(color: AppColors.gray950),
              )
            ],
          )
        ],
      ),
    );
  }
}
