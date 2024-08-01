
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';

class CustomAddressSwitch extends StatelessWidget {
  const CustomAddressSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Transform.translate(
            offset: Offset(10, 0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Transform.scale(
                scale: .8,
                child: Switch(
                  splashRadius: 0,
                  materialTapTargetSize:
                      MaterialTapTargetSize.values[1],
                  value: true,
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
                      WidgetStatePropertyAll(AppColors.mainColor),
                  activeColor: Colors.white,
                  trackOutlineColor: WidgetStateColor.transparent,
                ),
              ),
            ),
          ),
          Text(
            'حفظ العنوان',
            style: AppStyles.textStyle13SB
                .copyWith(color: AppColors.gray400),
          ),
        ],
      ),
    );
  }
}
