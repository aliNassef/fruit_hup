import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service_locator.dart';
import '../../data/repo/profile_repo_impl.dart';
import '../view_model/profile_cubit/profile_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(
          getIt.get<ProfileRepoImpl>(),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ProfileViewBody(),
          ),
        ),
      ),
    );
  }
}
