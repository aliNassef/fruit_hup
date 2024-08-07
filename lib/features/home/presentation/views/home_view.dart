import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/home/data/repo/home_repo_impl.dart';
import 'package:fruit_hup/features/home/presentation/view_model/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:fruit_hup/features/home/presentation/view_model/get_offers_cubit/get_offers_cubit.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetAllProductCubit(getIt.get<HomeRepoImpl>())..getAllProducts(),
          ),
          BlocProvider(
            create: (context) =>
                GetOffersCubit(getIt.get<HomeRepoImpl>())..getOffers(),
          ),
        ],
        child: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
