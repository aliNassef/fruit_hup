import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';

class TopIndicatorBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(20),
        Divider(
          endIndent: 140.w,
          indent: 140.w,
          color: Color(0xff131F46),
          height: 3,
          thickness: 3,
        ),
        VerticalSpace(7),
      ],
    );
  }
}
