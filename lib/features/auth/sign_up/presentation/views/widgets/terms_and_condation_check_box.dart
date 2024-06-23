import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../generated/l10n.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          side: BorderSide(
            color: AppColors.borderColor,
            width: 1.5,
            strokeAlign: 2,
          ),
          activeColor: AppColors.borderColor,
          focusColor: AppColors.borderColor,
          checkColor: AppColors.borderColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          value: false,
          onChanged: (val) {},
        ),
        Text.rich(
          textAlign: TextAlign.right,
          TextSpan(
            children: [
              TextSpan(
                text: S.of(context).fromRules,
                style: AppStyles.textStyle13SB.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              TextSpan(
                text: S.of(context).termsAndCondation,
                style: AppStyles.textStyle13SB.copyWith(
                  color: AppColors.secondryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
