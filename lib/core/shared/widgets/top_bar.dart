import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import '../../utils/app_colors.dart';
import '../functions/locale.dart';
import '../../utils/app_styles.dart';
import 'cirrcle_arrow.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: isArabic() ? 16.w : 0,
            left: !isArabic() ? 16.w : 0,
          ),
          child: CircleArrow(
            onTap: onTap,
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          text,
          style: AppStyles.textStyle19B,
        ),
        Spacer(
          flex: 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.green50,
            child: SvgPicture.asset(
              AppImages.notificationIcon,
              width: 20.w,
              height: 20.h,
            ),
          ),
        )
      ],
    );
  }
}
/** Spacer(
          flex: 3,
        ), */