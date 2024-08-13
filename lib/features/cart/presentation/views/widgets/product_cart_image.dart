import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductCartImage extends StatelessWidget {
  const ProductCartImage({
    super.key,
    required this.img,
  });
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: 73.w,
      decoration: BoxDecoration(
        color: AppColors.fillProductColor,
      ),
      child: CachedNetworkImage(
        imageUrl: img,
        height: 40.h,
        width: 53.w,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: AppColors.mainColor,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
