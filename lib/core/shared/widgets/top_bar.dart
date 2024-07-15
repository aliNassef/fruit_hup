import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_images.dart';
import '../../utils/app_router.dart';
import 'package:go_router/go_router.dart';
import '../../utils/app_colors.dart';
import '../functions/locale.dart';
import '../../utils/app_styles.dart';
import 'cirrcle_arrow.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.text,
    this.onTap,
    this.showLeading = true,
  });
  final String text;
  final void Function()? onTap;
  final bool showLeading;

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
          child: showLeading
              ? CircleArrow(
                  onTap: onTap,
                )
              : null,
        ),
        Spacer(
          flex: showLeading ? 2 : 3,
        ),
        Text(
          text,
          style: AppStyles.textStyle19B,
        ),
        Spacer(
          flex: 2,
        ),
        InkWell(
          onTap: () {
            log('tapped');
            context.push(AppRouter.notificationView);
          },
          child: Padding(
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
          ),
        )
      ],
    );
  }
}
