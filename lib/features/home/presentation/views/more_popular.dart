import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service_locator.dart';
import '../../data/repo/home_repo_impl.dart';
import '../view_model/get_all_product_cubit/get_all_product_cubit.dart';

import 'widgets/more_popular_body.dart';

class MorePopular extends StatelessWidget {
  const MorePopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            GetAllProductCubit(getIt.get<HomeRepoImpl>())..getAllProducts(),
        child: SafeArea(
          child: const MorePopularBody(),
        ),
      ),
    );
  }
}
