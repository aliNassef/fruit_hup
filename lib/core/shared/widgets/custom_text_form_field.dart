import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../functions/locale.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.showIcon = false,
    this.controller,
  });
  final String hintText;
  final bool showIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: TextFormField(
        controller: controller,
        style: AppStyles.textStyle16SB.copyWith(
          color: AppColors.gray950,
        ),
        cursorColor: AppColors.gray400,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyles.textStyle13B.copyWith(
            color: AppColors.gray400,
          ),
          filled: true,
          fillColor: Color(0xffF9FAFA), //#E6E9EA
          border: borderStyle(),
          enabledBorder: borderStyle(),
          focusedBorder: borderStyle(),
          suffixIcon: showIcon && isArabic()
              ? Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Icon(
                    Icons.visibility_rounded,
                    color: AppColors.grayForIcon,
                  ),
                )
              : null,
          prefixIcon: showIcon && !isArabic()
              ? Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Icon(
                    Icons.visibility,
                    color: AppColors.grayForIcon,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Color(0xffE6E9EA),
      ),
    );
  }
}
