import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../product_details/presentation/views/widgets/counter_row.dart';

class ProductCartDetails extends StatelessWidget {
  const ProductCartDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Watermelon',
          style: AppStyles.textStyle13B.copyWith(
            color: AppColors.gray950,
          ),
        ),
        VerticalSpace(8),
        Text(
          '1kg',
          style: AppStyles.textStyle13R.copyWith(
            color: AppColors.orange500,
          ),
        ),
        VerticalSpace(6),
        CounterRow(
          horizantalPadding: 0,
          radius: 12,
        ),
      ],
    );
  }
}
