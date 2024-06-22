import 'cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setupGetIt() async {
  await getIt.registerSingleton<CacheHelper>(CacheHelper());
}
