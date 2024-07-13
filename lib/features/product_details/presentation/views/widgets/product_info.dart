import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'counter_row.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'Watermelon',
              style: AppStyles.textStyle16B.copyWith(color: AppColors.gray950),
            ),
            VerticalSpace(8),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                children: [
                  TextSpan(
                    text: '${20}جنية /',
                    style: AppStyles.textStyle13B
                        .copyWith(color: AppColors.orange500),
                  ),
                  TextSpan(
                    text: ' كيلو',
                    style: AppStyles.textStyle13SB
                        .copyWith(color: AppColors.orange300),
                  )
                ],
              ),
            ),
          ],
        ),
        CounterRow(),
      ],
    );
  }
}
