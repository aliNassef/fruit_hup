import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_styles.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.text, required this.icon});
  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.center,
          child: icon,
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
