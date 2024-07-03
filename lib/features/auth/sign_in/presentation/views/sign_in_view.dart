import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/service_locator.dart';
import '../../data/repo/sign_in_repo_impl.dart';
import '../view_model/sign_in_cubit/sign_in_cubit.dart';

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
