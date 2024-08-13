import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/cache/cache_helper.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/core/shared/functions/toast_dialog.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:fruit_hup/generated/l10n.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is NameChanged) {
                showToast(text: 'Name changed successfully');
              }
              if (state is PassChanged) {
                showToast(text: 'Password changed successfully');
              }
            },
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const VerticalSpace(16),
                TopBar(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  showLeading: true,
                  showTrailing: false,
                  text: S.of(context).personalAccount,
                ),
                const VerticalSpace(24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).personalInfo,
                        style: AppStyles.textStyle13SB.copyWith(
                          color: AppColors.gray950,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(20),
                // name
                CustomTextFormField(
                  controller: cubit.newName,
                  showIcon: true,
                  icon: Image.asset(AppImages.edit_icon, height: 20, width: 20),
                  hintText: getIt
                          .get<CacheHelper>()
                          .getData(key: AppConstants.username) ??
                      'ali',
                ),
                const VerticalSpace(8),

                // email
                CustomTextFormField(
                  readOnly: true,
                  showIcon: true,
                  icon: Image.asset(AppImages.edit_icon, height: 20, width: 20),
                  hintText: getIt
                          .get<CacheHelper>()
                          .getData(key: AppConstants.useremail) ??
                      'test@gmail.com',
                ),
                const VerticalSpace(16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Text(
                        S.of(context).changePass,
                        style: AppStyles.textStyle13SB.copyWith(
                          color: AppColors.gray950,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpace(8),
                //  currentPass
                CustomTextFormField(
                  secure: cubit.secureCurrentPass,
                  controller: cubit.currentPass,
                  showIcon: true,
                  icon: GestureDetector(
                    onTap: () {
                      log(cubit.secureCurrentPass.toString());
                      cubit.changeSecurePass(index: 0);
                      log(cubit.secureCurrentPass.toString());
                    },
                    child: Icon(
                      cubit.secureCurrentPass
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: AppColors.grayForIcon,
                    ),
                  ),
                  hintText: S.of(context).currentPass,
                ),
                const VerticalSpace(8),
                // new Pass
                CustomTextFormField(
                  secure: cubit.secureNewPass,
                  controller: cubit.newPass,
                  showIcon: true,
                  icon: GestureDetector(
                    onTap: () {
                      cubit.changeSecurePass(index: 1);
                    },
                    child: Icon(
                      cubit.secureNewPass
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: AppColors.grayForIcon,
                    ),
                  ),
                  hintText: S.of(context).newPass,
                ),
                const VerticalSpace(8),
                // confirm New Pass
                CustomTextFormField(
                  secure: cubit.secureReNewPass,
                  controller: cubit.reNewPass,
                  showIcon: true,
                  icon: GestureDetector(
                    onTap: () {
                      cubit.changeSecurePass(index: 2);
                    },
                    child: Icon(
                      cubit.secureReNewPass
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: AppColors.grayForIcon,
                    ),
                  ),
                  hintText: S.of(context).confirmPass,
                ),
                const VerticalSpace(32),
                DefaultAppButton(
                  text: S.of(context).saveChanges,
                  onPressed: () {
                    saveChanges(context);
                  },
                ),
                const VerticalSpace(32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveChanges(BuildContext context) async {
    log(
      await getIt.get<CacheHelper>().getSecureData(AppConstants.userPass),
    );
    final cubit = context.read<ProfileCubit>();
    if (cubit.newName.text.isNotEmpty) {
      cubit.changeUserName(name: cubit.newName.text);
    }
    if (cubit.currentPass.text.isNotEmpty &&
        cubit.newPass.text.isNotEmpty &&
        cubit.reNewPass.text.isNotEmpty) {
      if ((await getIt
                  .get<CacheHelper>()
                  .getSecureData(AppConstants.userPass) ==
              cubit.currentPass.text) &&
          (cubit.newPass.text == cubit.reNewPass.text)) {
        log(cubit.newPass.text);
        cubit.changeUserpass(newpass: cubit.newPass.text);
        getIt
            .get<CacheHelper>()
            .setSecureData(AppConstants.userPass, cubit.newPass.text);
      } else {
        showToast(text: 'passwords are not the same');
      }
    } else {
      showToast(text: 'please fill all the fields');
    }
  }
}
