import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/widgets/app_spacer.dart';
import '../../../../../core/shared/widgets/top_bar.dart';
import '../../view_model/get_orders_cubit/getorders_cubit.dart';
import '../../view_model/get_orders_cubit/getorders_state.dart';

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
        BlocBuilder<GetordersCubit, GetordersState>(
          builder: (context, state) {
            if (state is GetordersLoaded) {
              log(state.orders.length.toString());
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => OrderItem(
                    orderModel: state.orders[index],
                  ),
                  separatorBuilder: (context, index) => const VerticalSpace(16),
                  itemCount: state.orders.length,
                ),
              );
            } else {
              log('message');
              return Container();
            }
          },
        ),
      ],
    );
  }
}
