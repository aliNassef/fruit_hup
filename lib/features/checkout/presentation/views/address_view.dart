import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/address_cubit/address_cubit.dart';
import 'widgets/address_view_body.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddressCubit(),
        child: SafeArea(
          child: AddressViewBody(),
        ),
      ),
    );
  }
}
