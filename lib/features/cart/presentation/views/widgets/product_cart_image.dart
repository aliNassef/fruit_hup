import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class ProductCartImage extends StatelessWidget {
  const ProductCartImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: 73.w,
      decoration: BoxDecoration(
        color: AppColors.fillProductColor,
      ),
      child: Image.asset(
        AppImages.watermillon,
        height: 40.h,
        width: 53.w,
      ),
    );
  }
}
