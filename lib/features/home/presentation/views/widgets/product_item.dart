import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 214.h,
          width: 163.w,
          decoration: BoxDecoration(color: AppColors.fillProductColor),
        ),
        Positioned(
          right: 8.w,
          top: 8.h,
          // child: SvgPicture.asset(
          //   AppImages.fav_icon,
          //   width: 24.w,
          //   height: 24.h,
          // ),
          child: InkWell(
            onTap: () {},
            child: Icon(
              FontAwesomeIcons.heart,
              color: Color(0xff292D32),
              size: 20,
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          left: 0,
          right: 0,
          child: Image.asset(
            AppImages.watermillon,
          ),
        ),
        Positioned(
          bottom: 15.h,
          right: 8.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'بطيخ',
                    style: AppStyles.textStyle13SB,
                  ),
                  VerticalSpace(4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20جنية /',
                          style: AppStyles.textStyle13B
                              .copyWith(color: AppColors.orange500),
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: AppStyles.textStyle13SB
                              .copyWith(color: AppColors.orange300),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              HorizontalSpace(15),
              CircleAvatar(
                backgroundColor: AppColors.mainColor,
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
