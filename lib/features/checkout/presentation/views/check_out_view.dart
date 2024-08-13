import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/checkout/presentation/views/widgets/check_out_view_body.dart';

import '../view_model/check_out_cubit/checkout_cubit.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CheckoutCubit(),
        child: SafeArea(
          child: CheckOutViewBody(),
        ),
      ),
    );
  }
}
