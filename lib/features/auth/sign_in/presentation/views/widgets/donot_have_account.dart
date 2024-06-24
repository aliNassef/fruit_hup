import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../generated/l10n.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: S.of(context).haveAccount,
            style: AppStyles.textStyle16SB.copyWith(color: AppColors.gray400),
          ),
          TextSpan(
            text: S.of(context).createNewAccount,
            style: AppStyles.textStyle16SB.copyWith(
              color: AppColors.mainColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push(AppRouter.signupView);
              },
          ),
        ],
      ),
    );
  }
}
