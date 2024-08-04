import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/cache/cache_helper.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/core/shared/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:fruit_hup/features/checkout/presentation/views/widgets/custom_address_switch.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/services/paymob_service.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/top_bar.dart';
import 'tap_bar_row.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();
    return SingleChildScrollView(
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
          CustomTextFormField(
            hintText: 'الاسم كامل',
            controller: addressCubit.nameController,
          ),
          const VerticalSpace(8),
          CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            controller: addressCubit.emailController,
          ),
          const VerticalSpace(8),
          CustomTextFormField(
            hintText: 'العنوان',
            controller: addressCubit.addressController,
          ),
          const VerticalSpace(8),
          CustomTextFormField(
            hintText: 'المدينه',
            controller: addressCubit.cityController,
          ),
          const VerticalSpace(8),
          CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            controller: addressCubit.departmentNumberController,
          ),
          const VerticalSpace(16),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              return CustomAddressSwitch();
            },
          ),
          const VerticalSpace(50),
          DefaultAppButton(
            text: 'التالي',
            onPressed: () {
              // still need validation

              if (addressCubit.switchValue) {
                getIt.get<CacheHelper>().saveData(
                      key: AppConstants.userAddrress,
                      value: addressCubit.addressController.text,
                    );
                getIt.get<CacheHelper>().saveData(
                      key: AppConstants.userCity,
                      value: addressCubit.cityController.text,
                    );
                getIt.get<CacheHelper>().saveData(
                      key: AppConstants.userDepartmentNumber,
                      value: addressCubit.departmentNumberController.text,
                    );

                // navigation to payment screen
                PaymobManager().getPaymentKey(100, 'EGP').then((value) {
                  launchUrl(
                    Uri.parse(
                        "https://accept.paymob.com/api/acceptance/iframes/791787?payment_token=$value"),
                  );
                });
              } else {}
            },
          ),
          const VerticalSpace(20),
        ],
      ),
    );
  }
}
