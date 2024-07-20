import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/cache/cache_helper.dart';
import '../../../../../../core/service_locator.dart';
import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../data/model/on_boarding_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.instance,
    required this.currentIndex,
  });
  final OnBoardingModel instance;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Image.asset(
              instance.backgroundImg,
              height: MediaQuery.sizeOf(context).height * .5,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.12,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                instance.img,
                height: 270.h,
                width: 250.w,
              ),
            ),
            Visibility(
              visible: currentIndex != introPages.length - 1,
              child: Positioned(
                top: 40.h,
                left: MediaQuery.sizeOf(context).width * .9,
                child: InkWell(
                  onTap: () {
                    getIt.get<CacheHelper>().saveData(
                          key: AppConstants.isLoggedOnce,
                          value: true,
                        );
                    context.go(AppRouter.signInView);
                  },
                  child: Text(
                    'تخط',
                    style: AppStyles.textStyle13R.copyWith(
                      color: AppColors.gray400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        VerticalSpace(48),
        SvgPicture.asset(
          AppImages.intro1,
          height: 43.h,
          width: 222.w,
        ),
        VerticalSpace(24),
        Text(
          instance.title,
          style: AppStyles.textStyle13SB.copyWith(
            color: AppColors.gray500,
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        VerticalSpace(64),
        DotsIndicator(
          dotsCount: introPages.length,
          position: currentIndex,
          decorator: DotsDecorator(
            color: currentIndex == introPages.length - 1
                ? AppColors.mainColor
                : AppColors.green500, // Inactive color
            activeColor: AppColors.mainColor,
          ),
        ),
        VerticalSpace(16),
        Visibility(
          visible: currentIndex == introPages.length - 1,
          child: DefaultAppButton(
            onPressed: () {
              getIt.get<CacheHelper>().saveData(
                    key: AppConstants.isLoggedOnce,
                    value: true,
                  );

              context.go(AppRouter.signInView);
            },
            text: 'ابدأ الان',
          ),
        ),
      ],
    );
  }
}
