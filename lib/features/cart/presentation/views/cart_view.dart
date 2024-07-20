import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../data/repo/cart_repo_impl.dart';
import '../view_model/cart_cubit/cart_cubit.dart';
import 'widgets/cart_view_body.dart';

import '../../../../generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCartAppBar(context),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CartCubit(
            getIt.get<CartRepoImpl>(),
          )..getCartItems(),
          child: const CartViewBody(),
        ),
      ),
    );
  }

  AppBar buildCartAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        S.of(context).cart,
        style: AppStyles.textStyle19B.copyWith(
          color: AppColors.gray950,
        ),
      ),
    );
  }
}
