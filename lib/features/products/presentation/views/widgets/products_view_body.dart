import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import '../../../../../core/shared/widgets/top_bar.dart';
import '../../../../home/presentation/views/widgets/product_grid_section.dart';
import '../../view_model/product_cubit/product_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/app_router.dart';
import 'horizantal_product_list.dart';
import 'product_header.dart';
import 'sorted_product_grid_section.dart';
import 'sorted_product_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(16),
        TopBar(showLeading: false,
          text: S.of(context).products,
        ),
        VerticalSpace(16),
        InkWell(
          onTap: () {
            context.push(AppRouter.searchView);
          },
          child: AbsorbPointer(
            child: CustomSearchBar(
              readOnly: true,
            ),
          ),
        ),
        VerticalSpace(16),
        BlocBuilder<ProductCubit, ProductState>(
          buildWhen: (previous, current) =>
              current is ProductLoaded ||
              current is ProductFailure ||
              current is ProductInitial ||
              current is ProductLoading,
          builder: (context, state) {
            if (state is ProductInitial) {
              return Expanded(
                child: Column(
                  children: [
                    ProductHeader(),
                    VerticalSpace(8),
                    HorizantalproductList(),
                    VerticalSpace(24),
                    ProductGridSection(),
                  ],
                ),
              );
            } else {
              if (state is ProductLoaded) {
                return Expanded(
                  child: Column(
                    children: [
                      SortedProductHeader(productCount: state.products.length),
                      VerticalSpace(16),
                      SortedProductGridSection(
                        products: state.products,
                      ),
                    ],
                  ),
                );
              } else if (state is ProductFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
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
            }
          },
        ),
      ],
    );
  }
}
