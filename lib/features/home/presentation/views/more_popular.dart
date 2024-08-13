import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/presentation/view_model/fav_cubit/fav_cubit.dart';
import '../../../../core/service_locator.dart';
import '../../../cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../data/repo/home_repo_impl.dart';
import '../view_model/get_all_product_cubit/get_all_product_cubit.dart';

import 'widgets/more_popular_body.dart';

class MorePopular extends StatelessWidget {
  const MorePopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetAllProductCubit(getIt.get<HomeRepoImpl>())..getAllProducts(),
          ),
          BlocProvider.value(
            value: getIt<CartCubit>(),
          ),
          BlocProvider.value(
            value: getIt<FavCubit>(),
          ),
        ],
        child: SafeArea(
          child: const MorePopularBody(),
        ),
      ),
    );
  }
}
