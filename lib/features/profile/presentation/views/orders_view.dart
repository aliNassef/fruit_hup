import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo_impl.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/get_orders_cubit/getorders_cubit.dart';
import 'package:fruit_hup/features/profile/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            GetordersCubit(getIt.get<ProfileRepoImpl>())..getOrders(),
        child: SafeArea(
          child: const OrdersViewBody(),
        ),
      ),
    );
  }
}
