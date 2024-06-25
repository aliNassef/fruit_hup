import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static final textStyle13R = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    fontFamily: 'Cairo',
  );
  static final textStyle13SB = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
    fontFamily: 'Cairo',
  );
  static final textStyle13B = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 13.sp,
    fontFamily: 'Cairo',
  );
  static final textStyle16R = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Cairo',
  );
  static final textStyle16SB = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Cairo',
  );
  static final textStyle16B = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Cairo',
  );
  static final textStyle19B = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Cairo',
    color: AppColors.gray950,
  );
}
