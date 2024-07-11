import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/model/notification_model.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.instanceOfNotification,
  });
  final NotificationModel instanceOfNotification;
  @override
  Widget build(BuildContext context) {
    String timeing = instanceOfNotification.hour! <= 12 ? "صباحا" : "مساء";
    final parts = instanceOfNotification.body!.split(' ');
    final discountIndex = parts.indexWhere((part) => part.contains('%'));
    final part1 = parts.sublist(0, discountIndex).join(' ');
    final discount = parts[discountIndex];
    final part2 = parts.sublist(discountIndex + 1).join(' ');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(instanceOfNotification.image ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAt2wlmTH1sX941o9i7CD47ZjR-_66nb8Yrw&s'),
            ),
          ),
        ),
        HorizontalSpace(16),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: part1,
                  style: AppStyles.textStyle13SB
                      .copyWith(color: AppColors.notificationTextColor),
                ),
                TextSpan(
                  text: ' $discount ',
                  style: AppStyles.textStyle16SB
                      .copyWith(color: AppColors.notificationDisColor),
                ),
                TextSpan(
                  text: part2,
                  style: AppStyles.textStyle13SB
                      .copyWith(color: AppColors.notificationTextColor),
                ),
              ],
            ),
          ),
        ),
        Text(
          '${instanceOfNotification.hour} $timeing',
          style: AppStyles.textStyle13R.copyWith(color: AppColors.gray400),
        ),
      ],
    );
  }
}
