import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/cart/data/model/cart_model.dart';
import 'package:fruit_hup/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../product_details/presentation/views/widgets/counter_row.dart';

class ProductCartDetails extends StatelessWidget {
  const ProductCartDetails({
    super.key,
    required this.instanceOfCartModel,
  });
  final CartModel instanceOfCartModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          instanceOfCartModel.name,
          style: AppStyles.textStyle13B.copyWith(
            color: AppColors.gray950,
          ),
        ),
        VerticalSpace(8),
        Text(
          '${instanceOfCartModel.quantity} ${instanceOfCartModel.measure}',
          style: AppStyles.textStyle13R.copyWith(
            color: AppColors.orange500,
          ),
        ),
        VerticalSpace(6),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return CounterRow(
              quantity: instanceOfCartModel.quantity,
              addButton: () {
                instanceOfCartModel.quantity++;
                context.read<CartCubit>().total +=
                    instanceOfCartModel.price.toInt();
                context.read<CartCubit>().increaseQuantity();
              },
              decreaseButton: () {
                if (instanceOfCartModel.quantity > 1) {
                  context.read<CartCubit>().total -=
                      instanceOfCartModel.price.toInt();
                  instanceOfCartModel.quantity--;
                  context.read<CartCubit>().decreaseQuantity();
                }
              },
              horizantalPadding: 0,
              radius: 12,
            );
          },
        ),
      ],
    );
  }
}
