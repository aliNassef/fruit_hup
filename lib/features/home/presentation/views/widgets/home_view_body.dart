import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import 'best_seller_row.dart';
import 'home_top_bar.dart';
import 'offers_carsural_slider.dart';
import 'product_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          VerticalSpace(16),
          HomeTopBar(),
          VerticalSpace(16),
          CustomSearchBar(),
          VerticalSpace(12),
          OffersCarsuralSlider(),
          VerticalSpace(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                BestSellerRow(),
                VerticalSpace(8),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 214.h,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItem();
                  },
                  itemCount: 10, // Set the number of items in your grid
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
