import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RepaintBoundary(
              child: SvgPicture.asset(
                AppImages.SplashPlanet,
                width: 192.w,
                height: 172.h,
              ),
            ),
            Spacer(),
            Center(
              child: RepaintBoundary(
                child: Image.asset(
                  AppImages.SplashLogo,
                  height: 173.h,
                  width: 178.w,
                ),
              ),
            ),
            Spacer(),
            RepaintBoundary(
              child: SvgPicture.asset(
                AppImages.SplashBottom,
                height: 165.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
