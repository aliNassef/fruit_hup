
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class BestSellerRow extends StatelessWidget {
  const BestSellerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).bestSeller,
          style: AppStyles.textStyle16B.copyWith(color: AppColors.gray950),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            S.of(context).lot,
            style: AppStyles.textStyle13R.copyWith(color: AppColors.gray400),
          ),
        ),
      ],
    );
  }
}
