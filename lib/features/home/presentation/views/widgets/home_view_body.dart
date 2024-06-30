import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/features/home/presentation/view_model/get_all_product_cubit/get_all_product_cubit.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import 'best_seller_row.dart';
import 'home_top_bar.dart';
import 'offers_carsural_slider.dart';
import 'product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(16),
        HomeTopBar(),
        VerticalSpace(16),
        CustomSearchBar(),
        VerticalSpace(12),
        OffersCarsuralSlider(),
        VerticalSpace(12),
        Expanded(
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
