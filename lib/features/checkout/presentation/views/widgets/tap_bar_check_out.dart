import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';

class TapbarCheckOut extends StatelessWidget {
  const TapbarCheckOut({
    super.key,
    this.isActive = false, required this.text,  this.num = 1,
  });
  final bool isActive;
  final String text;
  final int num;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isActive
            ? SvgPicture.asset(AppImages.checkout)
            : CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xffF2F3F3),
                child: Text(
                  '${num}',
                  style: AppStyles.textStyle13SB
                      .copyWith(color: AppColors.gray950),
                ),
              ),
        HorizontalSpace(4),
        Text(
          text,
          style: isActive
              ? AppStyles.textStyle13B.copyWith(
                  color: AppColors.mainColor,
                )
              : AppStyles.textStyle13SB.copyWith(
                  color: Color(0xffAAAAAA),
                ),
        ),
      ],
    );
  }
}
