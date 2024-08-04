import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/checkout/presentation/view_model/address_cubit/address_cubit.dart';

class CustomAddressSwitch extends StatelessWidget {
  const CustomAddressSwitch({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Transform.translate(
            offset: Offset(10, 0),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Transform.scale(
                scale: .8,
                child: Switch(
                  splashRadius: 0,
                  materialTapTargetSize: MaterialTapTargetSize.values[1],
                  value: addressCubit.switchValue,
                  onChanged: (bool value) {
                    addressCubit.changeSwitchVal(value);
                  },
                  inactiveThumbColor: Colors.white,
                  trackOutlineWidth: WidgetStatePropertyAll(0),
                  thumbIcon: WidgetStatePropertyAll(
                    Icon(
                      Icons.circle,
                      color: Colors.transparent,
                    ),
                  ),
                  trackColor: WidgetStatePropertyAll(addressCubit.switchValue
                      ? AppColors.mainColor
                      : AppColors.gray400),
                  activeColor: Colors.white,
                  trackOutlineColor: WidgetStateColor.transparent,
                ),
              ),
            ),
          ),
          Text(
            'حفظ العنوان',
            style: AppStyles.textStyle13SB.copyWith(color: AppColors.gray400),
          ),
        ],
      ),
    );
  }
}
