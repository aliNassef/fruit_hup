import 'package:flutter/material.dart';
import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../core/shared/widgets/or_dvider.dart';
import 'donot_have_account.dart';
import 'forget_pass_button.dart';
import 'sign_in_with_another_way.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VerticalSpace(20),
          TopBar(
            text: S.of(context).login,
          ),
          VerticalSpace(24),
          CustomTextFormField(
            hintText: S.of(context).email,
          ),
          VerticalSpace(16),
          CustomTextFormField(
            hintText: S.of(context).password,
            showIcon: true,
          ),
          VerticalSpace(16),
          ForgetPassButton(),
          VerticalSpace(33),
          DefaultAppButton(
            text: S.of(context).login,
          ),
          VerticalSpace(33),
          DonotHaveAccount(),
          VerticalSpace(33),
          OrDivider(),
          SignInWithAnotherWay(),
        ],
      ),
    );
  }
}
