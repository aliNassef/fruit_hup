import 'package:flutter/material.dart';
import 'package:fruit_hup/features/profile/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const OrdersViewBody(),
      ),
    );
  }
}
