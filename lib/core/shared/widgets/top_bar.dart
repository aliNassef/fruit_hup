import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/functions/locale.dart';
import '../../utils/app_styles.dart';
import 'cirrcle_arrow.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.text,
  });
  final String text;
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
          child: CircleArrow(),
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          text,
          style: AppStyles.textStyle19B,
        ),
        Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
