import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class TimeLineNode extends StatelessWidget {
  final bool isDone;
  final bool isConnected, isFirst;

  const TimeLineNode(
      {super.key,
      required this.isDone,
      this.isConnected = true,
      this.isFirst = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isConnected
            ? Container(
                height: 50.h,
                width: 2.w,
                color: AppColors.mainColor,
              )
            : !isFirst
                ? const VerticalSpace(50)
                : SizedBox(),
        Container(
          height: 15.h,
          width: 15.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? AppColors.mainColor : Color(0xffEBEBEB),
          ),
        ),
      ],
    );
  }
}

class TimeLine extends StatelessWidget {
  const TimeLine(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isDone,
      this.isConnected = true,
      this.isFirst = false});
  final String title, subTitle;
  final bool isDone, isConnected, isFirst;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TimeLineNode(
          isFirst: isFirst,
          isDone: isDone,
          isConnected: isConnected,
        ),
        const HorizontalSpace(10),
        Text(
          title,
          style: AppStyles.textStyle13SB.copyWith(color: AppColors.gray950),
        ),
        Spacer(),
        Text(
          subTitle,
          style: AppStyles.textStyle13SB.copyWith(color: AppColors.gray400),
        ),
      ],
    );
  }
}
