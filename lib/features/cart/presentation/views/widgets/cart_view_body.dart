import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is CartLoaded ||
          current is CartFailure ||
          current is CartLoading,
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
                    index: index,
                    cartItem: cartItems[index],
                  ),
                  separatorBuilder: (context, index) => VerticalSpace(4),
                  itemCount: cartItems.length,
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return DefaultAppButton(
                    text: 'الدفع ${context.read<CartCubit>().total} جنيه',
                    onPressed: () {},
                  );
                },
              ),
              VerticalSpace(20),
            ],
          );
        } else if (state is CartFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShimmerLoading(
                  height: 40.h, width: MediaQuery.sizeOf(context).width),
              VerticalSpace(24),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ShimmerLoading(height: 100.h, width: double.infinity),
                  separatorBuilder: (context, index) => VerticalSpace(4),
                  itemCount:
                      10, // You can adjust the item count for the shimmer effect
                ),
              ),
              ShimmerLoading(
                  height: 50.h, width: double.infinity), // Button shimmer
              VerticalSpace(20),
            ],
          );
        }
      },
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerLoading({required this.height, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }
}
