import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/order_model.dart';

class ExpansionTileTitle extends StatelessWidget {
  const ExpansionTileTitle({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 33,
          backgroundColor: AppColors.green50,
          child: SvgPicture.asset(
            AppImages.order,
            height: 32.h,
            width: 32.w,
          ),
        ),
        const HorizontalSpace(16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderModel.order_id.substring(0, 6),
              style: AppStyles.textStyle13B.copyWith(color: Colors.black),
            ),
            Text(
              '${orderModel.created_at.toDate().day}/ ${orderModel.created_at.toDate().month}/ ${orderModel.created_at.toDate().year}',
              style: AppStyles.textStyle11R.copyWith(color: AppColors.gray400),
            ),
            const VerticalSpace(6),
            Row(
              children: [
                Text(
                  'طلباتي',
                  style:
                      AppStyles.textStyle13R.copyWith(color: AppColors.gray400),
                ),
                HorizontalSpace(10),
                Text(
                  orderModel.amount.toString(),
                  style: AppStyles.textStyle13B,
                ),
                Text(
                  orderModel.currency,
                  style: AppStyles.textStyle13B,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
