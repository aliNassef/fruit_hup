
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class BeforeSearchResult extends StatelessWidget {
  const BeforeSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'عمليات البحث الأخيرة',
          style: AppStyles.textStyle16SB.copyWith(
            color: AppColors.gray950,
          ),
        ),
        Spacer(),
        Text(
          'حذف الكل',
          style: AppStyles.textStyle13R.copyWith(
            color: AppColors.gray400,
          ),
        ),
      ],
    );
  }
}
