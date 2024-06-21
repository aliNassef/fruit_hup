import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';

import '../../../generated/l10n.dart';
import '../../utils/app_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.borderColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              S.of(context).or,
              style: AppStyles.textStyle16SB,
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.borderColor,
            ),
          ),
        ],
      ),
    );
  }
}
