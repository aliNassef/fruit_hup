import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/layout/presentation/views/layout_view.dart';
import 'package:fruit_hup/generated/l10n.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).pay,
                  style: AppStyles.textStyle19B.copyWith(
                    color: AppColors.gray950,
                  ),
                ),
              ],
            ),
            const VerticalSpace(67),
            Image.asset(
              AppImages.paySuccess,
              height: 107.h,
              width: 154.w,
            ),
            const VerticalSpace(33),
            Text(
              S.of(context).success,
              style: AppStyles.textStyle16B.copyWith(color: AppColors.gray950),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .4,
            ),
            DefaultAppButton(
              text: S.of(context).main,
              onPressed: () {
                navigatorKey.currentState?.pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LayoutView(),
                  ),
                );
              },
            ),
            const VerticalSpace(16),
          ],
        ),
      ),
    );
  }
}
