import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class CircleArrow extends StatelessWidget {
  const CircleArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        AppImages.right_arrow2,
        height: 24.h,
        width: 24.w,
      ),
    );
  }
}
