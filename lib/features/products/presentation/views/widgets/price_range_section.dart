import 'package:flutter/material.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class PriceRangeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: '0',
          ),
        ),
        Text(
          S.of(context).to,
          style: AppStyles.textStyle13B.copyWith(
            color: AppColors.gray950,
          ),
        ),
        Expanded(child: CustomTextFormField(hintText: '0')),
      ],
    );
  }
}
