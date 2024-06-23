import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/auth/sign_up/data/repo/sign_up_repo_impl.dart';
import 'package:fruit_hup/features/auth/sign_up/presentation/view_model/sign_up_cubit/sign_up_cubit.dart';

import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt.get<SignUpRepoImpl>()),
        child: SafeArea(
          child: const SignUpViewBody(),
        ),
      ),
    );
  }
}
