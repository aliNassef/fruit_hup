import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/app_images.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Image.asset(
              AppImages.OnboardingFrame1,
              height: MediaQuery.sizeOf(context).height * .5,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.12,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                AppImages.FruitsBasket,
                height: 270.h,
                width: 250.w,
              ),
            ),
          ],
        ),


        
      ],
    );
  }
}
