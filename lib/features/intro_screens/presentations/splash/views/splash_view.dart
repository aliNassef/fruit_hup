import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import 'widgets/splash_view_app_bar.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    executeNav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SplashViewAppBar(),
      body: SplashViewBody(),
    );
  }

  void executeNav() {
    Future.delayed(
      Duration(seconds: 3),
      () => GoRouter.of(context).pushReplacement(
        AppRouter.OnBoardingView,
      ),
    );
  }
}
