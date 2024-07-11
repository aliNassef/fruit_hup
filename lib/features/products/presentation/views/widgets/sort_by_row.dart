import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../view_model/product_cubit/product_cubit.dart';

class SortByRow extends StatelessWidget {
  const SortByRow({
    super.key,
    required this.text,
    required this.checkBoxValue,
  });
  final String text;
  final bool checkBoxValue;
  @override
  Widget build(BuildContext context) {
    return Row(
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
          fillColor: WidgetStatePropertyAll(
            !checkBoxValue ? Colors.white : AppColors.mainColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          value: checkBoxValue,
          onChanged: (val) {
            context.read<ProductCubit>().changeCheckBoxValue(checkBoxValue);
          },
        ),
        Text(
          text,
          style: AppStyles.textStyle13B.copyWith(
            color: AppColors.gray950,
          ),
        ),
      ],
    );
  }
}
