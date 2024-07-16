import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service_locator.dart';
import '../../../home/data/repo/home_repo_impl.dart';
import '../../../home/presentation/view_model/get_all_product_cubit/get_all_product_cubit.dart';
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
       
        ],
        child: SafeArea(
          child: ProductsViewBody(),
        ),
      ),
    );
  }
}
