import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_model/product_cubit/product_cubit.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'bottom_sheet_container.dart';
import 'filter_button_icon.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).ourProducts,
            style: AppStyles.textStyle16B.copyWith(color: AppColors.gray950),
          ),
          InkWell(
            onTap: () {
              ProductCubit productCubit = context.read<ProductCubit>();
              showModalBottomSheet(
                useSafeArea: true,
                backgroundColor: Color(0xff000000).withOpacity(0.2),
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                builder: (context) {
                  return BlocProvider.value(
                    value: productCubit..getIntialBottomSheetState(),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: BottomSheetContainer(),
                      ),
                    ),
                  );
                },
              );
            },
            child: FilterButtonIcon(),
          )
        ],
      ),
    );
  }
}
