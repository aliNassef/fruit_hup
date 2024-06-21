import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/generated/l10n.dart';

import '../../../../../../core/shared/widgets/or_dvider.dart';
import 'donot_have_account.dart';
import 'forget_pass_button.dart';
import 'sign_with_another_way.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        VerticalSpace(20),
        TopBar(
          text: S.of(context).login,
          icon: Image.asset(
            AppImages.right_arrow,
            height: 20.h,
            width: 15.w,
          ),
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              VerticalSpace(16),
              SignWithAnotherWay(
                
              ),
              VerticalSpace(16),
              SignWithAnotherWay(),
              VerticalSpace(16),
              SignWithAnotherWay(),
            ],
          ),
        ),
      ],
    );
  }
}
