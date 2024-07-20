import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/service_locator.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
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
    if (getIt.get<CacheHelper>().getData(key: AppConstants.isLoggedOnce) ==
        null) {
      getIt
          .get<CacheHelper>()
          .saveData(key: AppConstants.isLoggedOnce, value: false);
    }
    Future.delayed(
      Duration(seconds: 3),
      () => getIt.get<CacheHelper>().getData(key: AppConstants.isLoggedOnce)
          ? GoRouter.of(context).pushReplacement(
              AppRouter.signInView,
            )
          : GoRouter.of(context).pushReplacement(
              AppRouter.OnBoardingView,
            ),
    );
  }
}
