import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/features/products/presentation/views/widgets/custom_range_slider.dart';
import 'package:fruit_hup/features/products/presentation/views/widgets/header_section_bottom_sheet.dart';
import 'package:fruit_hup/features/products/presentation/views/widgets/price_range_section.dart';

import 'top_indicator_bottom_sheet.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TopIndicatorBottomSheet(),
          HeaderSectionBottomSheet(),
          VerticalSpace(16),
          PriceRangeSection(),
          VerticalSpace(16),
          CustomRangeSlider(),
          DefaultAppButton(text: 'تصفيه'),
        ],
      ),
    );
  }
}
