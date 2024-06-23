import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';
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
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoaded) {
        } else if (state is SignInFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errMessage),
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 50,
                width: 50,
                child: AlertDialog(
                  alignment: Alignment.center,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
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
                controller: context.read<SignInCubit>().email,
                hintText: S.of(context).email,
              ),
              VerticalSpace(16),
              CustomTextFormField(
                controller: context.read<SignInCubit>().pass,
                hintText: S.of(context).password,
                showIcon: true,
              ),
              VerticalSpace(16),
              ForgetPassButton(),
              VerticalSpace(33),
              DefaultAppButton(
                onPressed: () async {
                  context.read<SignInCubit>().signInWithEmailAndPassword(
                      email: context.read<SignInCubit>().email.text,
                      pass: context.read<SignInCubit>().pass.text);
                },
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
      },
    );
  }
}
