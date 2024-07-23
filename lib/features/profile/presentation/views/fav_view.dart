import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/fav_cubit/fav_cubit.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

import '../../../home/presentation/views/widgets/product_item.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            VerticalSpace(16),
            TopBar(
              onTap: () => Navigator.pop(context),
              text: S.of(context).fav,
              showTrailing: false,
            ),
            VerticalSpace(20),
            BlocBuilder<FavCubit, FavState>(
              builder: (context, state) {
                if (state is FavLoaded) {
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
                        return ProductItem(
                          onTap: () {
                            // Add to cart
                            //   context.read<CartCubit>().addProductToCart(
                            //         index: index,
                            //         quantity: 1,
                            //         img:s.image,
                            //         price: AppConstants.products[index].price,
                            //         name: AppConstants.products[index].name,
                            //         measure: AppConstants.products[index].measure,
                            //       );
                            //    log('added to cart');
                          },
                          instanceOfProduct: state.products[index],
                        );
                      },
                      itemCount: state.products.length,
                    ),
                  );
                } else if (state is FavFailure) {
                  return Center(child: Text(state.errMessage));
                } else {
                  return Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
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
        ),
      ),
    );
  }
}