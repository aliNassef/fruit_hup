import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import '../view_model/forget_pass_cubit/forget_pass_cubit.dart';
 
import 'widgets/forget_pass_view_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ForgetPassCubit(),
          child: const ForgetPassViewBody(),
        ),
      ),
    );
  }
}
