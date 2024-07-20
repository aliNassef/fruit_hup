import '../features/cart/data/repo/cart_repo_impl.dart';
import '../features/profile/data/repo/profile_repo_impl.dart';

import 'api/api_services.dart';
import '../features/home/data/repo/home_repo_impl.dart';
import '../features/search/data/repo/search_repo_impl.dart';

import '../features/auth/sign_in/data/repo/sign_in_repo_impl.dart';
import '../features/auth/sign_up/data/repo/sign_up_repo_impl.dart';

import '../features/products/data/repo/product_repo_impl.dart';
import 'cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
setupGetIt() async {
  // cache helper and api sevice
  await getIt.registerSingleton<CacheHelper>(CacheHelper());
  await getIt.registerSingleton<ApiServices>(ApiServices());

  // auth

  await getIt.registerSingleton<SignInRepoImpl>(SignInRepoImpl());
  await getIt.registerSingleton<SignUpRepoImpl>(SignUpRepoImpl());

  // home
  await getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      api: getIt.get<ApiServices>(),
    ),
  );
  // search
  await getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
    api: getIt.get<ApiServices>(),
  ));

  // product
  await getIt.registerSingleton<ProductRepoImpl>(ProductRepoImpl(
    api: getIt.get<ApiServices>(),
  ));
  // cart
  await getIt.registerSingleton<CartRepoImpl>(CartRepoImpl());
  // Profile
  await getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl());
}
