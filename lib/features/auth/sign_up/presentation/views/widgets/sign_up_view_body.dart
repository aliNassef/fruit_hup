import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared/functions/toast_dialog.dart';
import '../../../../../../core/shared/widgets/default_app_button.dart';
import '../../view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/shared/functions/build_loading_box.dart';
import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../sign_in/presentation/views/widgets/donot_have_account.dart';
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
        child: Form(
          key: context.read<SignUpCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VerticalSpace(20),
              TopBar(
                onTap: () {
                  context.pop();
                },
                text: S.of(context).newaccount,
              ),
              VerticalSpace(24),
              CustomTextFormField(
                hintText: S.of(context).fullname,
              ),
              VerticalSpace(16),
              CustomTextFormField(
                validator: (val) {
                  final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                  if (val == null || val.isEmpty) {
                    return 'Please enter an email';
                  } else if (!regex.hasMatch(val)) {
                    return 'Please enter a valid Gmail address';
                  }
                  return null;
                },
                controller: context.read<SignUpCubit>().email,
                hintText: S.of(context).email,
              ),
              VerticalSpace(16),
              CustomTextFormField(
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
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
                    if (context
                        .read<SignUpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<SignUpCubit>().signUpWithEmailAndPass();
                    }
                  } else if (context.read<SignUpCubit>().checkedBox == false) {
                    showToast(text: 'هل توافق على الشروط والاحكام');
                  }
                },
                text: S.of(context).signUp,
              ),
              VerticalSpace(30),
              DonotHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
