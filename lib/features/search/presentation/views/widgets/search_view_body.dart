import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import '../../../../../core/shared/widgets/top_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../view_model/search_cubit/search_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
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
            onSaved: (val) {
              print(" *********** " + val!);
              context.read<SearchCubit>().addQuery(val: val);
            },
            searchControler: context.read<SearchCubit>().search,
          ),
          VerticalSpace(24),
          context.read<SearchCubit>().search.text.isEmpty
              ? BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoaded) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            BeforeSearchResult(),
                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SearchItemListTile(
                                  title: state.searchList[index],
                                  index: index,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 0,
                                );
                              },
                              itemCount: state.searchList.length,
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchFailure) {
                      return Center(child: Text(state.errMessage));
                    } else if (state is SearchDeleteAllQueries) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            BeforeSearchResult(),
                          ],
                        ),
                      );
                    } else {
                      return ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: ListTile(
                              title: Container(
                                width: double.infinity,
                                height: 16.0,
                                color: Colors.white,
                              ),
                              leading: Container(
                                width: 24.0,
                                height: 24.0,
                                color: Colors.white,
                              ),
                              trailing: Container(
                                width: 24.0,
                                height: 24.0,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 0,
                          );
                        },
                        itemCount: 3, // Number of shimmer items to display
                      );
                    }
                  },
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
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
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
                                onTap: () {
                                  context.read<CartCubit>().addProductToCart(
                                        index: index,
                                        quantity: 1,
                                        img: filteredItems[index].image,
                                        price: filteredItems[index].price,
                                        name: filteredItems[index].name,
                                        measure: filteredItems[index].measure,
                                      );
                                  log('added to cart');
                                },
                                index: index,
                                instanceOfProduct: filteredItems[index],
                              );
                            },
                            itemCount: filteredItems
                                .length, // Set the number of items in your grid
                          ),
                        ],
                      ),
                    ),
        ],
      ),
    );
  }
}
