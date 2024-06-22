import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';

class SignWithAnotherWay extends StatelessWidget {
  const SignWithAnotherWay({super.key, required this.img, required this.text});
  final String img;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HorizontalSpace(19),
          Image.asset(
            img,
            height: 20.h,
            width: 20.w,
          ),
          Spacer(),
          Text(
            text,
            style: AppStyles.textStyle16SB.copyWith(
              color: AppColors.gray950,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
