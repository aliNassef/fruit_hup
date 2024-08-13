import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductRatingAndReview extends StatelessWidget {
  const ProductRatingAndReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFC529),
          size: 20.h,
        ),
        HorizontalSpace(4),
        Text(
          '4.5',
          style: AppStyles.textStyle13SB.copyWith(
            color: Color(0xff111719),
          ),
        ),
        HorizontalSpace(9),
        Text(
          '(+30)',
          style: AppStyles.textStyle13R.copyWith(
            color: Color(0xff9796A1),
          ),
        ),
        HorizontalSpace(9),
        Text(
          'المراجعة',
          style: AppStyles.textStyle13SB.copyWith(
            color: AppColors.mainColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.mainColor,
          ),
        ),
      ],
    );
  }
}
