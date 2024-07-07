
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../constants.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../view_model/get_all_product_cubit/get_all_product_cubit.dart';
import 'best_seller_row.dart';
import 'product_item.dart';

class ProductGridSection extends StatelessWidget {
  const ProductGridSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            BestSellerRow(),
            VerticalSpace(8),
            BlocBuilder<GetAllProductCubit, GetAllProductState>(
              builder: (context, state) {
                if (state is GetAllProductLoaded) {
                  return Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 10.w,
                        mainAxisExtent: 214.h,
                      ),
                      itemBuilder: (context, index) {
                        return ProductItem(
                          instanceOfProduct: AppConstants.products[index],
                        );
                      },
                      itemCount: AppConstants.products
                          .length, // Set the number of items in your grid
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
        ),
      ),
    );
  }
}
