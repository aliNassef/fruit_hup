import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../view_model/product_cubit/product_cubit.dart';

class SortByRow extends StatelessWidget {
  const SortByRow({
    super.key,
    required this.text,
     required this.index,
  });
  final String text;

  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();
        bool checkBoxValue;
        if (index == 0) {
          checkBoxValue = cubit.checkBoxAsc;
        } else if (index == 1) {
          checkBoxValue = cubit.checkBoxDesc;
        } else {
          checkBoxValue = cubit.checkBoxAlaph;
        }
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
                cubit.changeCheckBoxValue(index);
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
      },
    );
  }
}
