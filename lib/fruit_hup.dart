import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        locale: Locale('ar'),
        
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          sliderTheme: SliderThemeData(
            activeTrackColor: AppColors.mainColor,
            inactiveTrackColor: AppColors.mainColor,
            thumbColor: AppColors.mainColor,
            thumbShape: const RoundSliderThumbShape(),
          ),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.gray400,
            selectionHandleColor: AppColors.gray400,
          ),
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
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
