import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/fav_cubit/fav_cubit.dart';
import 'package:fruit_hup/features/profile/presentation/views/about_us.dart';
import 'package:fruit_hup/features/profile/presentation/views/fav_view.dart';
import 'package:fruit_hup/features/profile/presentation/views/my_profile_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../core/shared/functions/build_loading_box.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_router.dart';
import '../../view_model/profile_cubit/profile_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'check_box_list_tile.dart';
import 'log_out_button.dart';
import 'profile_list_tile.dart';
import 'user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogOutLoaded) {
          context.go(AppRouter.signInView);
        }
        if (state is LogOutLoading) {
          buildLoadingBox(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(16),
            TopBar(
              showLeading: false,
              showTrailing: false,
              text: S.of(context).myProfile,
            ),
            VerticalSpace(20),
            UserInfo(),
            VerticalSpace(30),
            Text(
              S.of(context).public,
              style: AppStyles.textStyle16B.copyWith(
                color: AppColors.gray950,
              ),
            ),
            VerticalSpace(20),
            ProfileListTile(
              onTap: () {
                final profileCubit = context.read<ProfileCubit>();

                navigateToNewPage(
                  context,
                  BlocProvider.value(
                    value: profileCubit,
                    child: const MyProfileView(),
                  ),
                );
              },
              icon: AppImages.profile_icon,
              text: S.of(context).personalAccount,
            ),
            ProfileListTile(
              icon: AppImages.orders_icon,
              text: S.of(context).myOrders,
            ),
            ProfileListTile(
              icon: AppImages.wallet_icon,
              text: S.of(context).payments,
            ),
            ProfileListTile(
              onTap: () {
                navigateToNewPage(
                  context,
                  BlocProvider(
                    create: (context) => FavCubit(),
                    child: const FavView(),
                  ),
                );
              },
              icon: AppImages.fav_icon,
              text: S.of(context).favorites,
            ),
            CheckBoxListTile(
              icon: AppImages.notification,
              text: S.of(context).notification,
            ),
            CheckBoxListTile(
              icon: AppImages.theme_choose,
              text: S.of(context).theme,
            ),
            VerticalSpace(22),
            Text(
              S.of(context).help,
              style: AppStyles.textStyle13B.copyWith(
                color: AppColors.gray950,
              ),
            ),
            VerticalSpace(16),
            ProfileListTile(
              onTap: () {
                navigateToNewPage(context, AboutUs());
              },
              icon: AppImages.info_circle,
              text: S.of(context).whoAreWe,
            ),
            LogOutButton(),
            VerticalSpace(20),
          ],
        ),
      ),
    );
  }

  void navigateToNewPage(BuildContext context, Widget newPage) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: newPage,
      withNavBar: true, // To keep the bottom nav bar
      pageTransitionAnimation: PageTransitionAnimation.fade,
    );
  }
}
