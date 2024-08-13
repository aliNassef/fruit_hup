import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../shared/widgets/layout_or_login.dart';
import '../../features/checkout/presentation/views/address_view.dart';
import '../../features/checkout/presentation/views/check_out_view.dart';
import '../../features/home/data/models/product_model.dart';
import '../../features/intro_screens/presentations/splash/views/splash_view.dart';
import '../../features/auth/sign_in/presentation/views/forgetpass_view.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../../features/home/presentation/views/more_popular.dart';
import '../../features/product_details/presentation/views/product_details_view.dart';
import '../../constants.dart';
import '../../features/auth/sign_up/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/intro_screens/presentations/onboarding/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/sign_in/presentation/views/sign_in_view.dart';
import '../../features/notification/presentation/views/notification_view.dart';
import '../../features/profile/presentation/views/my_profile_view.dart';
import '../../features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const signInView = '/SignInView';
  static const layoutOrLogin = '/LayoutOrLogin';
  static const signupView = '/SignUpView';
  static const homeView = '/HomeView';
  static const OnBoardingView = '/OnboardingView';
  static const searchView = '/SearchView';
  static const morePopular = '/MorePopular';
  static const notificationView = '/NotificationView';
  static const productDetailsView = '/ProductDetailsView';
  static const layoutView = '/LayoutView';
  static const myProfile = '/MyProfile';
  static const addressView = '/AddressView';
  static const paymentView = '/PaymentView';
  static const checkoutView = '/checkoutView';
  static const forgetpassView = '/forgetpassView';

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: OnBoardingView,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: layoutOrLogin,
        builder: (context, state) {
          return const LayoutOrLogin();
        },
      ),
      GoRoute(
        path: layoutView,
        builder: (context, state) {
          return LayoutView();
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: LayoutView(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
      GoRoute(
        path: forgetpassView,
        builder: (context, state) {
          return ForgetPassView();
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: ForgetPassView(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
      GoRoute(
        path: checkoutView,
        builder: (context, state) {
          return CheckOutView();
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: CheckOutView(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
      GoRoute(
        path: addressView,
        builder: (context, state) {
          return AddressView();
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: AddressView(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
      GoRoute(
        path: signInView,
        builder: (context, state) {
          return SignInView();
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: SignInView(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
      GoRoute(
        path: signupView,
        builder: (context, state) {
          return SignUpView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) {
          return HomeView();
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: HomeView(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
      GoRoute(
          path: productDetailsView,
          builder: (context, state) {
            final message = state.extra as Map<String, dynamic>;
            final instanceOfProduct = message['model'] as ProductModel;
            final index = message['index'] as int;
            return ProductDetailsView(
              index: index,
              instanceOfProduct: instanceOfProduct,
            );
          },
          pageBuilder: (context, state) {
            final message = state.extra as Map<String, dynamic>;
            final instanceOfProduct = message['model'] as ProductModel;
            final index = message['index'] as int;
            return CustomTransitionPage(
              child: ProductDetailsView(
                index: index,
                instanceOfProduct: instanceOfProduct,
              ),
              transitionsBuilder: buildEaseoutAnimation,
              transitionDuration: Duration(milliseconds: 300),
            );
          }),
      GoRoute(
        path: searchView,
        builder: (context, state) {
          return SearchView();
        },
      ),
      GoRoute(
        path: morePopular,
        builder: (context, state) {
          return MorePopular();
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: MorePopular(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
      GoRoute(
        path: notificationView,
        builder: (context, state) {
          final RemoteMessage? message = state.extra as RemoteMessage?;
          return NotificationView(
            message: message,
          );
        },
        pageBuilder: (context, state) {
          final RemoteMessage? message = state.extra as RemoteMessage?;

          return CustomTransitionPage(
            child: NotificationView(
              message: message,
            ),
            transitionsBuilder: buildEaseoutAnimation,
            transitionDuration: Duration(milliseconds: 300),
          );
        },
      ),
      GoRoute(
        path: myProfile,
        builder: (context, state) {
          return MyProfileView(); // New Profile View
        },
        pageBuilder: (context, state) => CustomTransitionPage(
          child: MyProfileView(),
          transitionsBuilder: buildEaseoutAnimation,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ),
    ],
  );

  static Widget buildEaseoutAnimation(
      context, animation, secondaryAnimation, child) {
    // Use ease-out curve
    return FadeTransition(
      opacity: animation.drive(
        CurveTween(
          curve: Curves.easeOut,
        ),
      ),
      child: child,
    );
  }
}
