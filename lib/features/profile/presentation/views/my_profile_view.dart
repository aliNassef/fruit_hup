import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/cache/cache_helper.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/generated/l10n.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VerticalSpace(16),
              TopBar(
                showLeading: true,
                showTrailing: false,
                text: S.of(context).personalAccount,
              ),
              VerticalSpace(24),
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
              VerticalSpace(20),
              CustomTextFormField(
                onSaved: (val) {},
                showIcon: true,
                icon: Image.asset(AppImages.edit_icon, height: 20, width: 20),
                hintText: getIt
                    .get<CacheHelper>()
                    .getData(key: AppConstants.username),
              ),
              VerticalSpace(8),
              CustomTextFormField(
                readOnly: true,
                showIcon: true,
                icon: Image.asset(AppImages.edit_icon, height: 20, width: 20),
                hintText: getIt
                    .get<CacheHelper>()
                    .getData(key: AppConstants.useremail),
              ),
              VerticalSpace(16),
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
              VerticalSpace(8),
              CustomTextFormField(
                onSaved: (val) {},
                showIcon: true,
                icon: Image.asset(AppImages.edit_icon, height: 20, width: 20),
                hintText: getIt
                    .get<CacheHelper>()
                    .getData(key: AppConstants.username),
              ),
              VerticalSpace(8),
              CustomTextFormField(
                onSaved: (val) {},
                showIcon: true,
                icon: Image.asset(AppImages.edit_icon, height: 20, width: 20),
                hintText: getIt
                    .get<CacheHelper>()
                    .getData(key: AppConstants.username),
              ),
              VerticalSpace(8),
              CustomTextFormField(
                onSaved: (val) {},
                showIcon: true,
                icon: Image.asset(AppImages.edit_icon, height: 20, width: 20),
                hintText: getIt
                    .get<CacheHelper>()
                    .getData(key: AppConstants.username),
              ),
              VerticalSpace(32),
              DefaultAppButton(text: S.of(context).saveChanges),
              VerticalSpace(32),
            ],
          ),
        ),
      ),
    );
  }
}
