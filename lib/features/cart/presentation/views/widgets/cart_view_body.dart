import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final cartItems = state.cartItems;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                color: Color(0xffEBF9F1),
                height: 40.h,
                width: MediaQuery.sizeOf(context).width,
                child: Text(
                  'لديك ${cartItems.length} منتجات في سله التسوق',
                  style: AppStyles.textStyle13R.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              VerticalSpace(24),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => CartItem(
                    cartItem: cartItems[index],
                  ),
                  separatorBuilder: (context, index) => VerticalSpace(4),
                  itemCount: cartItems.length,
                ),
              ),
              DefaultAppButton(
                text: 'تقديم الطلب',
                onPressed: () {},
              ),
              VerticalSpace(20),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
