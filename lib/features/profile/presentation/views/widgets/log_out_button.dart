
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/profile_cubit/profile_cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ProfileCubit>().logout();
      },
      child: Container(
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
    );
  }
}
