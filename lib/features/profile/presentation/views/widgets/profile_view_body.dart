import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/service_locator.dart';
import '../../../../../core/utils/locale/language_cubit/change_lang_cubit.dart';
import '../../../../cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../view_model/fav_cubit/fav_cubit.dart';
import '../about_us.dart';
import '../fav_view.dart';
import '../my_profile_view.dart';
import '../orders_view.dart';
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
            const VerticalSpace(16),
            TopBar(
              showLeading: false,
              showTrailing: false,
              text: S.of(context).myProfile,
            ),
            const VerticalSpace(20),
            UserInfo(),
            const VerticalSpace(30),
            Text(
              S.of(context).public,
              style: AppStyles.textStyle16B.copyWith(
                color: AppColors.gray950,
              ),
            ),
            const VerticalSpace(20),
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
              onTap: () {
                navigateToNewPage(
                  context,
                  OrdersView(),
                );
              },
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
                  MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: getIt<FavCubit>()..getFavProducts(),
                      ),
                      BlocProvider.value(
                        value: getIt<CartCubit>(),
                      ),
                    ],
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
            ProfileListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ChangeLanguageDialog(),
                );
              },
              icon: AppImages.language_icon,
              text:  S.of(context).lang,
              showLang: true,
            ),
            CheckBoxListTile(
              icon: AppImages.theme_choose,
              text: S.of(context).theme,
            ),
            const VerticalSpace(22),
            Text(
              S.of(context).help,
              style: AppStyles.textStyle13B.copyWith(
                color: AppColors.gray950,
              ),
            ),
            const VerticalSpace(16),
            ProfileListTile(
              onTap: () {
                navigateToNewPage(context, AboutUs());
              },
              icon: AppImages.info_circle,
              text: S.of(context).whoAreWe,
            ),
            const VerticalSpace(20),
            LogOutButton(),
            const VerticalSpace(20),
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

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      title: Text(
        S.of(context).chooseLanguage,
        textAlign: TextAlign.center,
        style: AppStyles.textStyle16B.copyWith(color: AppColors.gray950),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                minimumSize: Size(100, 40),
              ),
              onPressed: () {
                context.read<ChangeLangCubit>().changeLangToEn();
                Navigator.of(context).pop(true);
              },
              child: Text(
                S.of(context).en,
                style: AppStyles.textStyle16B.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.mainColor),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                minimumSize: Size(100, 40),
              ),
              onPressed: () {
                context.read<ChangeLangCubit>().changeLangToAr();
                Navigator.of(context).pop(false);
              },
              child: Text(
                S.of(context).ar,
                style:
                    AppStyles.textStyle16B.copyWith(color: AppColors.mainColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
