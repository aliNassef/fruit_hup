import 'package:flutter/material.dart';
import 'package:fruit_hup/core/shared/widgets/app_spacer.dart';
import 'package:fruit_hup/core/shared/widgets/top_bar.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(16),
        TopBar(
          text: 'طلباتي',
          showTrailing: false,
        ),
        const VerticalSpace(16),
        ExpansionTile(
          title: Text('طلباتي'),
          children: [
            Text('طلباتي'),
            Text('طلباتي'),
            Text('طلباتي'),
            Text('طلباتي'),
          ],
        ),
      ],
    );
  }
}
