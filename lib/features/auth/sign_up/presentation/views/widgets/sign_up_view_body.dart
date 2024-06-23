import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../generated/l10n.dart';
import 'terms_and_condation_check_box.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VerticalSpace(20),
          TopBar(
            text: S.of(context).newaccount,
          ),
          VerticalSpace(24),
          CustomTextFormField(
            hintText: S.of(context).fullname,
          ),
          VerticalSpace(16),
          CustomTextFormField(
            hintText: S.of(context).email,
          ),
          VerticalSpace(16),
          CustomTextFormField(
            hintText: S.of(context).password,
            showIcon: true,
          ),
          VerticalSpace(16),
          TermsAndConditionsCheckbox(),
          VerticalSpace(30),
          DefaultAppButton(
            text: S.of(context).signUp,
          ),
          VerticalSpace(30),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).haveAccount,
                  style: AppStyles.textStyle16SB.copyWith(
                    color: AppColors.gray400,
                  ),
                ),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.push(AppRouter.signInView);
                    },
                  text: S.of(context).login,
                  style: AppStyles.textStyle16SB.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
