import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 15)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          alignment: Alignment.center,
          backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
        ),
        onPressed: () {},
        child: Text(
          'start',
          style: AppStyles.textStyle16B.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
