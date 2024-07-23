import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cart/data/repo/cart_repo_impl.dart';
import '../../../cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import '../../../../core/service_locator.dart';
import '../../../home/data/repo/home_repo_impl.dart';
import '../../../home/presentation/view_model/get_all_product_cubit/get_all_product_cubit.dart';
import '../../../profile/presentation/view_model/fav_cubit/fav_cubit.dart';
import '../../data/repo/product_repo_impl.dart';
import '../view_model/product_cubit/product_cubit.dart';

import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

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
            create: (context) => ProductCubit(
              getIt.get<ProductRepoImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) => CartCubit(
              getIt.get<CartRepoImpl>(),
            ),
          ),
          BlocProvider.value(
            value: getIt<FavCubit>(),
          ),
        ],
        child: SafeArea(
          child: ProductsViewBody(),
        ),
      ),
    );
  }
}
