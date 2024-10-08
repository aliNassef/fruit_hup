import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/sign_in_cubit/sign_in_cubit.dart';

import '../../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../generated/l10n.dart';
import 'sign_with_another_way.dart';

class SignInWithAnotherWay extends StatelessWidget {
  const SignInWithAnotherWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
           const   VerticalSpace(16),
              SignWithAnotherWay(
                onTap: () async {
                  context.read<SignInCubit>().signInWithGoogle();
                },
                img: AppImages.google,
                text: S.of(context).signwithgoogle,
              ),
           const   VerticalSpace(16),
              SignWithAnotherWay(
                img: AppImages.apple,
                text: S.of(context).signwithapple,
              ),
           const   VerticalSpace(16),
              SignWithAnotherWay(
                img: AppImages.facebook,
                text: S.of(context).signwithfacebook,
              ),
            ],
          ),
        );
      },
    );
  }
}
