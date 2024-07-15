import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_colors.dart';
import 'package:fruit_hup/core/utils/app_styles.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/cart_view_body.dart';

import '../../../../generated/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          S.of(context).cart,
          style: AppStyles.textStyle19B.copyWith(
            color: AppColors.gray950,
          ),
        ),
      ),
      body: SafeArea(
        child: const CartViewBody(),
      ),
    );
  }
}
