import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/functions/toast_dialog.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/default_app_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../view_model/product_cubit/product_cubit.dart';
import 'custom_range_slider.dart';
import 'header_section_bottom_sheet.dart';
import 'price_range_section.dart';
import 'package:go_router/go_router.dart';

import 'sort_by_row.dart';
import 'top_indicator_bottom_sheet.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 312.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TopIndicatorBottomSheet(),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is bottomSheetIntial) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeaderSectionBottomSheet(),
                      VerticalSpace(16),
                      PriceRangeSection(),
                      VerticalSpace(5),
                      CustomRangeSlider(
                        start: double.parse(
                            context.read<ProductCubit>().startPrice.text.isEmpty
                                ? '0'
                                : context.read<ProductCubit>().startPrice.text),
                        end: double.parse(
                            context.read<ProductCubit>().endPrice.text.isEmpty
                                ? '0'
                                : context.read<ProductCubit>().endPrice.text),
                      ),
                      VerticalSpace(16),
                      DefaultAppButton(
                        text: 'تصفيه',
                        onPressed: () {
                          context.read<ProductCubit>().changeBottomSheetPage();
                        },
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Text(
                          'ترتيب حسب :',
                          style: AppStyles.textStyle19B.copyWith(
                            color: AppColors.gray950,
                          ),
                        ),
                      ),
                      SortByRow(
                        index: 0,
                        text: 'السعر ( الأقل الي الأعلي )',
                      ),
                      SortByRow(
                        index: 1,
                        text: 'السعر ( الأعلي الي الأقل )',
                      ),
                      SortByRow(
                        index: 2,
                        text: 'الأبجديه',
                      ),
                      VerticalSpace(16),
                      DefaultAppButton(
                        text: 'تصفيه',
                        onPressed: () {
                          validateFilterButton(context);
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateFilterButton(BuildContext context) {
    if (context.read<ProductCubit>().checkBoxAsc &&
        (context.read<ProductCubit>().checkBoxAlaph == false &&
            context.read<ProductCubit>().checkBoxDesc == false)) {
      context.read<ProductCubit>().fetchProducts(sortBy: 'price', asc: true);
      context.pop();
    } else if (context.read<ProductCubit>().checkBoxDesc &&
        (context.read<ProductCubit>().checkBoxAlaph == false &&
            context.read<ProductCubit>().checkBoxAsc == false)) {
      context.read<ProductCubit>().fetchProducts(sortBy: 'price', asc: false);
      context.pop();
    } else if (context.read<ProductCubit>().checkBoxAlaph &&
        (context.read<ProductCubit>().checkBoxAsc == false &&
            context.read<ProductCubit>().checkBoxDesc == false)) {
      context.read<ProductCubit>().fetchProducts(sortBy: 'name', asc: true);
      context.pop();
    } else {
      log('Focused');
      if (context.read<ProductCubit>().checkBoxAlaph == false &&
          context.read<ProductCubit>().checkBoxDesc == false &&
          context.read<ProductCubit>().checkBoxAsc == false) {
        showToast(text: 'يجب عليك تحديد خيار الترتيب');
      } else {
        showToast(text: 'يجب عليك تحديد خيار واحد');
      }
    }
  }
}
