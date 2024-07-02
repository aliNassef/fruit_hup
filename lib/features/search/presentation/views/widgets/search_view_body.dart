import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/shared/widgets/custom_search_bar.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_images.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../home/data/models/product_model.dart';
import '../../../../home/presentation/views/widgets/product_item.dart';
import 'before_search_result.dart';
import 'search_item_list_tile.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  List<ProductModel> filteredItems = [];
  @override
  void initState() {
    super.initState();
    filteredItems = AppConstants.products;
    context.read<SearchCubit>().search.addListener(_search);
  }

  void _search() {
    final query = context.read<SearchCubit>().search.text.toLowerCase();
    setState(() {
      filteredItems = AppConstants.products.where((item) {
        return item.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VerticalSpace(16),
          TopBar(
            text: S.of(context).search,
            onTap: () {
              context.pop();
            },
          ),
          VerticalSpace(16),
          CustomSearchBar(
            searchControler: context.read<SearchCubit>().search,
          ),
          VerticalSpace(24),
          context.read<SearchCubit>().search.text.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      BeforeSearchResult(),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
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
                    ],
                  ),
                )
              : filteredItems.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        VerticalSpace(100),
                        Image.asset(
                          AppImages.noResult,
                          height: 230.h,
                          width: 230.w,
                          fit: BoxFit.cover,
                        ),
                        VerticalSpace(20),
                        Text(
                          S.of(context).search,
                          style: AppStyles.textStyle16B
                              .copyWith(color: AppColors.gray600),
                        ),
                        VerticalSpace(6),
                        Text(
                          'عفوًا... هذه المعلومات غير متوفرة للحظة',
                          style: AppStyles.textStyle13R
                              .copyWith(color: AppColors.gray400),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 10.w,
                            mainAxisExtent: 214.h,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(
                              instanceOfProduct: filteredItems[index],
                            );
                          },
                          itemCount: filteredItems
                              .length, // Set the number of items in your grid
                        ),
                      ],
                    ),
        ],
      ),
    );
  }
}
