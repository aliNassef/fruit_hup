import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../functions/locale.dart';

class CircleArrow extends StatelessWidget {
  const CircleArrow({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.borderColor,
          ),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: !isArabic()
            ? Padding(
                padding: EdgeInsets.all(13.0),
                child: SvgPicture.asset(
                  AppImages.left_arrow_icon,
                  height: 24.h,
                  width: 24.w,
                ),
              )
            : Image.asset(
                AppImages.right_arrow2,
                height: 24.h,
                width: 24.w,
              ),
      ),
    );
  }
}
