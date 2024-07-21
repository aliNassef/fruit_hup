import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/generated/l10n.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              hintText: 'hintText',
            ),
            VerticalSpace(8),
            CustomTextFormField(
              hintText: 'hintText',
            ),
            VerticalSpace(8),
            CustomTextFormField(
              hintText: 'hintText',
            )
          ],
        ),
      ),
    );
  }
}
