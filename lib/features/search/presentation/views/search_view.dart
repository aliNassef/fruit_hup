import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service_locator.dart';
import '../../data/repo/search_repo_impl.dart';
import '../view_model/search_cubit/search_cubit.dart';

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
