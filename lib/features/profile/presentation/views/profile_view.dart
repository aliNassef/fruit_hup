import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo_impl.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          S.of(context).myProfile,
          style: AppStyles.textStyle19B.copyWith(
            color: AppColors.gray950,
          ),
        ),
        centerTitle: true,
      ),
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
