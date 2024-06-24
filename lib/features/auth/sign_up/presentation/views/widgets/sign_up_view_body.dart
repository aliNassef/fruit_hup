import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/auth/sign_up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/shared/functions/build_loading_box.dart';
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
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoaded) {
          context.go(AppRouter.homeView);
        } else if (state is SignUpFailure) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errMessage),
              );
            },
          );
        } else if (state is SignUpLoading) {
          buildLoadingBox(context);
        }
      },
      builder: (context, state) => SingleChildScrollView(
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
              controller: context.read<SignUpCubit>().email,
              hintText: S.of(context).email,
            ),
            VerticalSpace(16),
            CustomTextFormField(
              controller: context.read<SignUpCubit>().pass,
              hintText: S.of(context).password,
              showIcon: true,
            ),
            VerticalSpace(16),
            TermsAndConditionsCheckbox(),
            VerticalSpace(30),
            DefaultAppButton(
              onPressed: () {
                if (context.read<SignUpCubit>().checkedBox == true) {
                  context.read<SignUpCubit>().signUpWithEmailAndPass();
                }
              },
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
      ),
    );
  }
}
