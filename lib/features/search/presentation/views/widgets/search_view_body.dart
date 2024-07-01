import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/custom_search_bar.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:fruit_hup/generated/l10n.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';
import 'search_item_list_tile.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(16),
        TopBar(text: S.of(context).search),
        VerticalSpace(16),
        CustomSearchBar(
          searchControler: context.read<SearchCubit>().search,
        ),
        VerticalSpace(24),
        context.read<SearchCubit>().search.text.isEmpty
            ? Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'عمليات البحث الأخيرة',
                            style: AppStyles.textStyle16SB.copyWith(
                              color: AppColors.gray950,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'حذف الكل',
                            style: AppStyles.textStyle13R.copyWith(
                              color: AppColors.gray400,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return SearchItemListTile();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 0,
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
