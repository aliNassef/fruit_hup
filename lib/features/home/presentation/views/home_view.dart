import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/fav_cubit/fav_cubit.dart';
import '../../../../core/service_locator.dart';
import '../../../cart/data/repo/cart_repo_impl.dart';
import '../../../cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../data/repo/home_repo_impl.dart';
import '../view_model/get_all_product_cubit/get_all_product_cubit.dart';
import '../view_model/get_offers_cubit/get_offers_cubit.dart';

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
          BlocProvider(
            create: (context) => CartCubit(getIt.get<CartRepoImpl>()),
          ),
          BlocProvider.value(
            value: getIt<FavCubit>(),
          ),
          BlocProvider.value(
            value: getIt<CartCubit>(),
          ),
        ],
        child: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
