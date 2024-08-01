import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
 import 'package:fruit_hup/features/checkout/presentation/views/widgets/custom_address_switch.dart';
import 'package:fruit_hup/features/checkout/presentation/views/widgets/tap_bar_row.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared/widgets/app_spacer.dart';
 
class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VerticalSpace(16),
            TopBar(
              onTap: () => context.pop(),
              text: 'العنوان',
              showTrailing: false,
            ),
            const VerticalSpace(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TapBarRow(
                isActive2: true,
              ),
            ),
            const VerticalSpace(24),
            CustomTextFormField(hintText: 'الاسم كامل'),
            const VerticalSpace(8),
            CustomTextFormField(hintText: 'البريد الإلكتروني'),
            const VerticalSpace(8),
            CustomTextFormField(hintText: 'العنوان'),
            const VerticalSpace(8),
            CustomTextFormField(hintText: 'المدينه'),
            const VerticalSpace(8),
            CustomTextFormField(hintText: 'رقم الطابق , رقم الشقه ..'),
            const VerticalSpace(16),
            CustomAddressSwitch(),
            const VerticalSpace(50),
            DefaultAppButton(text: 'التالي', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
