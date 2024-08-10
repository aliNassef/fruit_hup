import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
 import '../../../../../core/utils/app_styles.dart';

class ProductDetailsItem extends StatelessWidget {
  const ProductDetailsItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final Widget title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 163.w,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(12, 8, 12, 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffF1F1F5),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title,
          const    VerticalSpace(4),
              Text(
                subtitle,
                style: AppStyles.textStyle13SB.copyWith(
                  color: Color(0xff979899),
                ),
              ),
            ],
          ),
      const    HorizontalSpace(16),
          SvgPicture.asset(
            image,
            height: 35.h,
            width: 35.w,
          ),
        ],
      ),
    );
  }
}
