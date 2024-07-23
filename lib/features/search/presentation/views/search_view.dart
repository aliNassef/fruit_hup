import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:fruit_hup/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/fav_cubit/fav_cubit.dart';
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  SearchCubit(getIt.get<SearchRepoImpl>())..getQueries(),
            ),
            BlocProvider.value(
              value: getIt<CartCubit>(),
            ),
            BlocProvider.value(
              value: getIt<FavCubit>(),
            ),
          ],
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
