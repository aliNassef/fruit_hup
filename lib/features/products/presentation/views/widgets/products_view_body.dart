import 'package:flutter/material.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/custom_search_bar.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/product_grid_section.dart';
import 'package:fruit_hup/generated/l10n.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'horizantal_product_list.dart';
import 'product_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(16),
        TopBar(
          text: S.of(context).products,
        ),
        VerticalSpace(16),
        InkWell(
          onTap: () {
            context.push(AppRouter.searchView);
          },
          child: AbsorbPointer(
            child: CustomSearchBar(
              readOnly: true,
            ),
          ),
        ),
        VerticalSpace(16),
        ProductHeader(),
        VerticalSpace(8),
        HorizantalproductList(),
        VerticalSpace(24),
        ProductGridSection(),
      ],
    );
  }
}
