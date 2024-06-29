import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/api/api_services.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/home/presentation/view_model/get_all_product_cubit/get_all_product_cubit.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            GetAllProductCubit(getIt.get<ApiServices>())..getAllProducts(),
        child: SafeArea(
          child: HomeViewBody(),
        ),
      ),
    );
  }
}
