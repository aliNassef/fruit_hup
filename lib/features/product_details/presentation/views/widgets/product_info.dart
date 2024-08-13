import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.instanceOfProduct,
  });
  final ProductModel instanceOfProduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              instanceOfProduct.name,
              style: AppStyles.textStyle16B.copyWith(color: AppColors.gray950),
            ),
       const     VerticalSpace(8),
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                children: [
                  TextSpan(
                    text: '${instanceOfProduct.price}جنية /',
                    style: AppStyles.textStyle13B
                        .copyWith(color: AppColors.orange500),
                  ),
                  TextSpan(
                    text: ' ${instanceOfProduct.measure}',
                    style: AppStyles.textStyle13SB
                        .copyWith(color: AppColors.orange300),
                  )
                ],
              ),
            ),
          ],
        ),
        //    CounterRow(),
      ],
    );
  }
}
