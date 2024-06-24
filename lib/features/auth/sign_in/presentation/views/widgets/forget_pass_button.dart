import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/shared/functions/locale.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../generated/l10n.dart';

class ForgetPassButton extends StatelessWidget {
  const ForgetPassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isArabic() ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          left: isArabic() ? 16.w : 0,
          right: isArabic() ? 0 : 16.w,
        ),
        child: Text(
          S.of(context).forgetPass,
          style: AppStyles.textStyle13SB.copyWith(
            color: AppColors.secondryColor,
          ),
        ),
      ),
    );
  }
}
