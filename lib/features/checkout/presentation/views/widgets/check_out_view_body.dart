import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/core/utils/app_router.dart';
import 'package:fruit_hup/features/checkout/presentation/view_model/check_out_cubit/checkout_cubit.dart';
import 'package:fruit_hup/features/checkout/presentation/views/widgets/payment_option_card.dart';
import 'package:fruit_hup/features/checkout/presentation/views/widgets/tap_bar_row.dart';
import 'package:go_router/go_router.dart';

class CheckOutViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace(16),
        TopBar(
          onTap: () => context.pop(),
          text: 'الشحن',
          showTrailing: false,
        ),
        const VerticalSpace(16),
        BlocBuilder<CheckoutCubit, CheckoutState>(
          builder: (context, state) {
            final checkoutCubit = context.read<CheckoutCubit>();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TapBarRow(),
                  const VerticalSpace(32),
                  PaymentOptionCard(
                    title: 'الدفع عند الاستلام',
                    subTitle: 'التسليم من المكان',
                    price: '200',
                    isActive: checkoutCubit.introPayMethod == 0,
                    onTap: () {
                      checkoutCubit.changeIntroPayMethod(0);
                    },
                  ),
                  VerticalSpace(8),
                  PaymentOptionCard(
                    title: 'اشتري الان وادفع لاحقا',
                    subTitle: 'يرجي تحديد طريقه الدفع',
                    price: '200',
                    isActive: checkoutCubit.introPayMethod == 1,
                    onTap: () {
                      checkoutCubit.changeIntroPayMethod(1);
                    },
                  ),
                  VerticalSpace(100),
                ],
              ),
            );
          },
        ),
        DefaultAppButton(
          text: 'التالي',
          onPressed: () {
            context.push(AppRouter.addressView);
          },
        ),
      ],
    );
  }
}
