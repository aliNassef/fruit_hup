import 'package:fruit_hup/core/api/api_services.dart';
import 'package:fruit_hup/features/home/data/repo/home_repo_impl.dart';

import '../features/auth/sign_in/data/repo/sign_in_repo_impl.dart';
import '../features/auth/sign_up/data/repo/sign_up_repo_impl.dart';

import 'cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setupGetIt() async {
  await getIt.registerSingleton<CacheHelper>(CacheHelper());
  await getIt.registerSingleton<ApiServices>(ApiServices());
  await getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      api: getIt.get<ApiServices>(),
    ),
  );

  await getIt.registerSingleton<SignInRepoImpl>(SignInRepoImpl());
  await getIt.registerSingleton<SignUpRepoImpl>(SignUpRepoImpl());
}
