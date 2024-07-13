import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../features/home/presentation/views/more_popular.dart';
import '../../features/product_details/presentation/views/product_details_view.dart';
import '../../constants.dart';
import '../../features/auth/sign_up/presentation/views/sign_up_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/intro_screens/presentations/onboarding/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/sign_in/presentation/views/sign_in_view.dart';
import '../../features/notification/presentation/views/notification_view.dart';
import '../../features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const signInView = '/SignInView';
  static const signupView = '/SignUpView';
  static const homeView = '/HomeView';
  static const OnBoardingView = '/OnboardingView';
  static const searchView = '/SearchView';
  static const morePopular = '/MorePopular';
  static const notificationView = '/NotificationView';
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ProductDetailsView();
        },
      ),
      GoRoute(
        path: OnBoardingView,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: signInView,
        builder: (context, state) {
          return SignInView();
        },
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

          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Use ease-out curve
            return FadeTransition(
              opacity: animation.drive(
                CurveTween(
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            );
          },
          transitionDuration:
              Duration(milliseconds: 300), // Set the duration here
        ),
      ),
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

          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Use ease-out curve
            return FadeTransition(
              opacity: animation.drive(
                CurveTween(
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            );
          },
          transitionDuration:
              Duration(milliseconds: 300), // Set the duration here
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
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Use ease-out curve
                return FadeTransition(
                  opacity: animation.drive(
                    CurveTween(
                      curve: Curves.easeOut,
                    ),
                  ),
                  child: child,
                );
              },
              transitionDuration: Duration(milliseconds: 300),
            );
          })
    ],
  );
}
