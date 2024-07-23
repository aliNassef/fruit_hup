import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/profile/data/repo/profile_repo_impl.dart';
import 'package:fruit_hup/features/profile/presentation/view_model/fav_cubit/fav_cubit.dart';
import '../../../../core/service_locator.dart';
import '../../data/repo/cart_repo_impl.dart';
import '../view_model/cart_cubit/cart_cubit.dart';
import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CartCubit(
                getIt.get<CartRepoImpl>(),
              )..getCartItems(),
            ),
            BlocProvider(
              create: (context) => FavCubit(
                getIt.get<ProfileRepoImpl>(),
              ),
            ),
          ],
          child: const CartViewBody(),
        ),
      ),
    );
  }
}
