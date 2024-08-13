import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../profile/presentation/view_model/fav_cubit/fav_cubit.dart';
import '../../view_model/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../generated/l10n.dart';
import 'product_item.dart';

class MorePopularBody extends StatelessWidget {
  const MorePopularBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const  VerticalSpace(16),
        TopBar(
          text: S.of(context).bestSeller,
          onTap: () {
            context.pop();
          },
        ),
     const   VerticalSpace(24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            S.of(context).bestSeller,
            style: AppStyles.textStyle16B.copyWith(
              color: AppColors.gray950,
            ),
          ),
        ),
    const    VerticalSpace(8),
        BlocBuilder<GetAllProductCubit, GetAllProductState>(
          builder: (context, state) {
            if (state is GetAllProductLoaded) {
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 214.h,
                  ),
                  itemBuilder: (context, index) {
                    final favCubit = context.read<FavCubit>();
                    return ProductItem(
                      addToCart: () {
                        context.read<CartCubit>().addProductToCart(
                            index: index,
                            quantity: 1,
                            img: AppConstants.products[index].image,
                            price: AppConstants.products[index].price,
                            name: AppConstants.products[index].name,
                            measure: AppConstants.products[index].measure);
                      },
                      addOrRemoveToFav: () {
                        favCubit.changeFav(index, AppConstants.products);
                      },
                      instanceOfProduct: AppConstants.products[index],
                    );
                  },
                  itemCount: AppConstants
                      .products.length, // Set the number of items in your grid
                ),
              );
            } else if (state is GetAllProductFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 10.w,
                      mainAxisExtent: 214.h,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      );
                    },
                    itemCount: 6, // Number of shimmer items to display
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
