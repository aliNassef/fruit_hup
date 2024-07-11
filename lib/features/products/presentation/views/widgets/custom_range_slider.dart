import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    super.key,
    required this.start,
    required this.end,
  });
  final double start, end;
  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late var _values;
  @override
  void initState() {
    super.initState();

    _values = RangeValues(widget.start % 300, widget.end % 300);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RangeSlider(
        values: _values,
        min: 0,
        max: 300,
        divisions: 10,
        labels: RangeLabels(
          '\$${widget.start..toString()}',
          '\$${widget.end.toString()}',
        ),
        activeColor: AppColors.mainColor,
        inactiveColor: Color(0xffEEEEEE).withOpacity(0.5),
        overlayColor: WidgetStatePropertyAll(AppColors.mainColor),
        onChanged: (RangeValues values) {
          setState(() {
            _values = values;
          });
        },
      ),
    );
  }
}
