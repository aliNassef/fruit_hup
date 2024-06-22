import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/service_locator.dart';

import 'core/cache/cache_helper.dart';
import 'fruit_hup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const FruitHup());
}
