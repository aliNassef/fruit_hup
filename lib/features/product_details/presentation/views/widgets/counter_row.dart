import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CounterRow extends StatelessWidget {
  const CounterRow({
    super.key,
    this.radius = 18,
    this.horizantalPadding = 12,
  });
  final double radius;
  final double horizantalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizantalPadding.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.mainColor,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          HorizontalSpace(10),
          Text(
            '1',
            style: AppStyles.textStyle16B.copyWith(color: AppColors.green950),
          ),
          HorizontalSpace(10),
          CircleAvatar(
            radius: radius,
            backgroundColor: Color(0xffF3F5F7),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.remove,
                color: Color(0xff979899),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
