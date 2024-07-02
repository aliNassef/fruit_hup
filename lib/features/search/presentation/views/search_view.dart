import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/search/data/repo/search_repo_impl.dart';
import 'package:fruit_hup/features/search/presentation/view_model/search_cubit/search_cubit.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              SearchCubit(getIt.get<SearchRepoImpl>())..getQueries(),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
