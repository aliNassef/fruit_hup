import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    super.key,
  });

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RangeSlider(
        values: RangeValues(40, 80),
        min: 20,
        max: 300,
        divisions: 500,
        labels: RangeLabels(
          '\$${40.toString()}',
          '\$${80.toString()}',
        ),
        activeColor: AppColors.mainColor,
        inactiveColor: Color(0xffEEEEEE).withOpacity(0.5),
        overlayColor: WidgetStatePropertyAll(AppColors.mainColor),
        onChanged: (RangeValues values) {
          setState(() {});
        },
      ),
    );
    // return SfRangeSlider(
    //   activeColor: AppColors.mainColor,
    //   inactiveColor: AppColors.mainColor,
    //   min: 0.0,
    //   max: 100.0,
    //   values: _values,
    //   interval: 20,
    //   showTicks: true,
    //   showLabels: true,
    //   enableTooltip: true,
    //   minorTicksPerInterval: 1,
    //   onChanged: (SfRangeValues values) {
    //     _values = values;
    //   },
    // );
  }
}
