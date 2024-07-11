import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/default_app_button.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/products/presentation/view_model/product_cubit/product_cubit.dart';
import 'package:fruit_hup/features/products/presentation/views/widgets/custom_range_slider.dart';
import 'package:fruit_hup/features/products/presentation/views/widgets/header_section_bottom_sheet.dart';
import 'package:fruit_hup/features/products/presentation/views/widgets/price_range_section.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TopIndicatorBottomSheet(),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is bottomSheetIntial || state is ProductInitial) {
                return Column(
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
                      checkBoxValue: context.read<ProductCubit>().checkBoxAsc,
                      text: 'السعر ( الأقل الي الأعلي )',
                    ),
                    SortByRow(
                      checkBoxValue: context.read<ProductCubit>().checkBoxDesc,
                      text: 'السعر ( الأعلي الي الأقل )',
                    ),
                    SortByRow(
                      checkBoxValue: context.read<ProductCubit>().checkBoxAlaph,
                      text: 'الأبجديه',
                    ),
                  ],
                );
              }
            },
          ),
          VerticalSpace(16),
          DefaultAppButton(
            text: 'تصفيه',
            onPressed: () {
              context.read<ProductCubit>().fetchProducts();
              context.read<ProductCubit>().changeBottomSheetPage();
              print(context.read<ProductCubit>().bottomSheetIndex);
              context.read<ProductCubit>().bottomSheetIndex++;
              print(context.read<ProductCubit>().bottomSheetIndex);
            },
          ),
        ],
      ),
    );
  }
}
