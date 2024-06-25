import 'package:flutter/material.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/custom_search_bar.dart';
import 'home_top_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(16),
        HomeTopBar(),
        VerticalSpace(16),
        CustomSearchBar(),
        VerticalSpace(12),
        
      ],
    );
  }
}
