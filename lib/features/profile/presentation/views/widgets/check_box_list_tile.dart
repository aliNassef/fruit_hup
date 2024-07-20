import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class CheckBoxListTile extends StatelessWidget {
  const CheckBoxListTile({super.key, required this.icon, required this.text});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffF2F3F3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(icon),
          HorizontalSpace(20),
          Text(
            text,
            style: AppStyles.textStyle13R.copyWith(
              color: AppColors.gray600,
            ),
          ),
          Spacer(),
          Switch(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: false,
            onChanged: (bool value) {},
            inactiveThumbColor: Colors.white,
            trackOutlineWidth: WidgetStatePropertyAll(0),
            thumbIcon: WidgetStatePropertyAll(
              Icon(
                Icons.circle,
                color: Colors.transparent,
              ),
            ),
            trackColor:
                WidgetStatePropertyAll(Color(0xff888FA0).withOpacity(0.5)),
            activeColor: AppColors.green500,
            trackOutlineColor: WidgetStateColor.transparent,
          ),
        ],
      ),
    );
  }
}
