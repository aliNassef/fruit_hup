import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../data/model/cart_model.dart';
import '../../view_model/cart_cubit/cart_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import 'product_cart_details.dart';
import 'product_cart_image.dart';

class ProductCartRow extends StatelessWidget {
  const ProductCartRow({
    super.key,
    required this.cartItem, required this.index,
  });
  final int index;
  final CartModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductCartImage(
          img: cartItem.img,
        ),
        HorizontalSpace(16),
        ProductCartDetails(
          instanceOfCartModel: cartItem,
        ),
        Spacer(),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.read<CartCubit>().removeProductFromCart(index: index);

                  },
                  child: SvgPicture.asset(
                    AppImages.trash,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
                VerticalSpace(30),
                Text(
                  '${cartItem.quantity * cartItem.price} جنية',
                  style: AppStyles.textStyle16SB.copyWith(
                    color: AppColors.orange500,
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
