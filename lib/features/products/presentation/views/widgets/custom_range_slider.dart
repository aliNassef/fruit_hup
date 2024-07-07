
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      min: 0,
      max: 500,
      activeColor: AppColors.mainColor,
      inactiveColor: AppColors.mainColor,
      values: RangeValues(0, 200),
      onChanged: (value) {},
    );
  }
}
