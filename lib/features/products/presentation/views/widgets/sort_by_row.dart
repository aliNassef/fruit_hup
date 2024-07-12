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
    required this.index,
  });
  final String text;
  final bool checkBoxValue;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
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
                if (index == 0) {
                  context.read<ProductCubit>().checkBoxAsc = val!;
                  context.read<ProductCubit>().changeCheckBoxValue(
                      context.read<ProductCubit>().checkBoxAsc);
                } else if (index == 1) {
                  context.read<ProductCubit>().checkBoxDesc = val!;
                  context.read<ProductCubit>().changeCheckBoxValue(
                      context.read<ProductCubit>().checkBoxDesc);
                } else {
                  context.read<ProductCubit>().checkBoxAlaph = val!;
                  context.read<ProductCubit>().changeCheckBoxValue(
                      context.read<ProductCubit>().checkBoxAlaph);
                }
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
