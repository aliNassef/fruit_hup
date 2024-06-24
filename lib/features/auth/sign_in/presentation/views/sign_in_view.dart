import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/auth/sign_in/data/repo/sign_in_repo_impl.dart';
import 'package:fruit_hup/features/auth/sign_in/presentation/view_model/sign_in_cubit/sign_in_cubit.dart';

import 'widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInCubit(getIt.get<SignInRepoImpl>()),
        child: SafeArea(
          child: const SignInViewBody(),
        ),
      ),
    );
  }
}
