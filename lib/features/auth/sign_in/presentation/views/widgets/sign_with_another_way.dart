import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class SignWithAnotherWay extends StatelessWidget {
  const SignWithAnotherWay({
    super.key,
    required this.img,
    required this.text,
    this.onTap,
  });
  final String img;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
