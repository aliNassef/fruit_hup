import 'package:fruit_hup/features/auth/sign_in/data/repo/sign_in_repo_impl.dart';

import 'cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setupGetIt() async {
  await getIt.registerSingleton<CacheHelper>(CacheHelper());
  await getIt.registerSingleton<SignInRepoImpl>(SignInRepoImpl());
}
