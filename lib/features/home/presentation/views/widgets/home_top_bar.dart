import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/service_locator.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(
              AppImages.demoProfilr,
            ),
          ),
          HorizontalSpace(11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).goodMorning,
                style: AppStyles.textStyle16R.copyWith(
                  color: AppColors.gray400,
                ),
              ),
              Text(
                getIt.get<CacheHelper>().getData(key: AppConstants.username),
                style: AppStyles.textStyle16B.copyWith(
                  color: AppColors.gray950,
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              log('tapped');
              context.push(AppRouter.notificationView);
            },
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
      ),
    );
  }
}
