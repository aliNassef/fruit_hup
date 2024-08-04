import 'package:flutter/material.dart';
import '../../../../../core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import 'home_top_bar.dart';
import 'offers_carsural_slider.dart';
import 'product_grid_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(16),
        HomeTopBar(),
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
        VerticalSpace(12),
        OffersCarsuralSlider(),
        VerticalSpace(12),
        ProductGridSection(),
      ],
    );
  }
}
