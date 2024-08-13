import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class PaymentOptionCard extends StatelessWidget {
  const PaymentOptionCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      this.isActive = false,
      this.onTap});
  final String title;
  final String subTitle;
  final String price;
  final bool isActive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        alignment: Alignment.center,
        height: 81.h,
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xffD9D9D9).withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 18.h,
              width: 18.w,
              decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isActive ? Colors.transparent : Color(0xff949D9E),
                ),
              ),
              child: isActive
                  ? CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.mainColor,
                    )
                  : null,
            ),
            HorizontalSpace(10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.textStyle13SB.copyWith(color: Colors.black),
                ),
            const    VerticalSpace(6),
                Text(
                  subTitle,
                  style: AppStyles.textStyle13R
                      .copyWith(color: Colors.black.withOpacity(.5)),
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                price + ' pound',
                style: AppStyles.textStyle13SB.copyWith(
                  color: Color(0xff3A8B33),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
