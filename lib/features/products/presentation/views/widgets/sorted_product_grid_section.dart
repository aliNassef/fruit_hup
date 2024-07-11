
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/data/models/product_model.dart';
import '../../../../home/presentation/views/widgets/product_item.dart';

class SortedProductGridSection extends StatelessWidget {
  const SortedProductGridSection({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
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
            instanceOfProduct: products[index],
          );
        },
        itemCount: products.length, // Set the number of items in your grid
      ),
    );
  }
}
