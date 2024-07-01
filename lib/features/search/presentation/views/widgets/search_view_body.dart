import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/shared/widgets/custom_search_bar.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';
import 'package:fruit_hup/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:fruit_hup/generated/l10n.dart';

import '../../../../../core/shared/widgets/app_spacer.dart';

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
      ],
    );
  }
}
