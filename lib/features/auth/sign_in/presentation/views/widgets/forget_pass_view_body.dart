import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/shared/functions/toast_dialog.dart';
import '../../../../../../core/shared/widgets/top_bar.dart';
import '../../view_model/forget_pass_cubit/forget_pass_cubit.dart';
import '../../view_model/forget_pass_cubit/forget_pass_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPassCubit, ForgetPassState>(
      listener: (context, state) {
        if (state is ForgetPassLoaded) {
          showToast(text: 'تم ارسال رمز التحقق على بريدك الالكتروني');
          context.pop();
        } else if (state is ForgetPassFailure) {
          showToast(text: state.errMessage);
        } else {}
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalSpace(16),
          TopBar(
            text: 'نسيان كلمة المرور',
            showTrailing: false,
            onTap: () => context.pop(),
          ),
          const VerticalSpace(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'لا تقلق ، ما عليك سوى كتابة بريدك الالكتروني وسنرسل رمز التحقق.',
              style: AppStyles.textStyle16SB.copyWith(color: AppColors.gray600),
            ),
          ),
          const VerticalSpace(30),
          CustomTextFormField(
            controller: context.read<ForgetPassCubit>().emailController,
            hintText: 'البريد الالكتروني',
          ),
          const VerticalSpace(30),
          DefaultAppButton(
            text: 'نسيت كلمة المرور',
            onPressed: () {
              context.read<ForgetPassCubit>().forgetPass();
            },
          )
        ],
      ),
    );
  }
}
