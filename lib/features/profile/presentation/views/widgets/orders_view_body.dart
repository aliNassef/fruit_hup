import 'package:flutter/material.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';

import 'order_item.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(16),
        TopBar(
          onTap: () {
            Navigator.pop(context);
          },
          text: 'طلباتي',
          showTrailing: false,
        ),
        const VerticalSpace(16),
        OrderItem(),
      ],
    );
  }
}
