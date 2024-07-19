import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/generated/l10n.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'check_box_list_tile.dart';
import 'profile_list_tile.dart';
import 'user_info.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            icon: AppImages.info_circle,
            text: S.of(context).whoAreWe,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 41.h,
            decoration: BoxDecoration(color: Color(0xFFEBF9F1)),
            child: Row(
              children: [
                Spacer(
                  flex: 3,
                ),
                Center(
                  child: Text(
                    S.of(context).signOut,
                    style: AppStyles.textStyle13B.copyWith(
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                SvgPicture.asset(
                  AppImages.signup_icon,
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
          VerticalSpace(20),
        ],
      ),
    );
  }
}
