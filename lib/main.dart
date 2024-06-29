import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/api/api_services.dart';
import 'core/service_locator.dart';

import 'core/cache/cache_helper.dart';
import 'firebase_options.dart';
import 'fruit_hup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ApiServices().getData();
  print("length " + '${AppConstants.products.length}');
  await CacheHelper().init();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(const FruitHup());
}
