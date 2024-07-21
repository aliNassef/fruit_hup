import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../layout/presentation/views/layout_view.dart';
import '../../../../../../core/shared/functions/build_loading_box.dart';
import '../../view_model/sign_in_cubit/sign_in_cubit.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../../core/utils/app_router.dart';
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
          debugPrint('sucess *************');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LayoutView(),
            ),
          );
        } else if (state is SignInFailure) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.errMessage),
              );
            },
          );
        } else {
          buildLoadingBox(context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: context.read<SignInCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VerticalSpace(20),
                TopBar(
                  showTrailing: false,
                  showLeading: false,
                  onTap: () {
                    context.go(AppRouter.OnBoardingView);
                  },
                  text: S.of(context).login,
                ),
                VerticalSpace(24),
                CustomTextFormField(
                  controller: context.read<SignInCubit>().email,
                  validator: (val) {
                    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                    if (val == null || val.isEmpty) {
                      return 'Please enter an email';
                    } else if (!regex.hasMatch(val)) {
                      return 'Please enter a valid Gmail address';
                    }
                    return null;
                  },
                  hintText: S.of(context).email,
                ),
                VerticalSpace(16),
                CustomTextFormField(
                  icon: Icon(
                    Icons.visibility_rounded,
                    color: AppColors.grayForIcon,
                  ),
                  controller: context.read<SignInCubit>().pass,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  hintText: S.of(context).password,
                  showIcon: true,
                ),
                VerticalSpace(16),
                ForgetPassButton(),
                VerticalSpace(33),
                DefaultAppButton(
                  onPressed: () async {
                    if (context
                        .read<SignInCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<SignInCubit>().signInWithEmailAndPassword(
                          email: context.read<SignInCubit>().email.text,
                          pass: context.read<SignInCubit>().pass.text);
                    }
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
          ),
        );
      },
    );
  }
}
