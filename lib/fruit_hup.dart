import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/core/utils/app_router.dart';

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
      // setting screen utils
      splitScreenMode: true,
      // for Api not reloading
      enableScaleWH: () => false,
      enableScaleText: () => false,
    );
  }
}
