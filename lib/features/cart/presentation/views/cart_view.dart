import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service_locator.dart';
import '../view_model/cart_cubit/cart_cubit.dart';
import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: getIt<CartCubit>()..getCartItems(),
          child: const CartViewBody(),
        ),
      ),
    );
  }
}
