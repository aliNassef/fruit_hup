import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/features/cart/data/model/cart_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import 'product_cart_details.dart';
import 'product_cart_image.dart';

class ProductCartRow extends StatelessWidget {
  const ProductCartRow({
    super.key,
    required this.cartItem,
  });
  final CartModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductCartImage(
          img: cartItem.img,
        ),
        HorizontalSpace(16),
        ProductCartDetails(
          instanceOfCartModel: cartItem,
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AppImages.trash,
                height: 20.h,
                width: 20.w,
              ),
            ),
            VerticalSpace(30),
            Text(
              '${cartItem.price} جنية',
              style: AppStyles.textStyle16SB.copyWith(
                color: AppColors.orange500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
