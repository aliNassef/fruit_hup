import 'package:flutter/material.dart';
import 'features/home/data/models/product_model.dart';
import 'features/notification/data/model/notification_model.dart';

import 'core/utils/app_images.dart';
import 'features/intro_screens/data/model/on_boarding_model.dart';

List<OnBoardingModel> introPages = [
  OnBoardingModel(
    backgroundImg: AppImages.OnboardingFrame1,
    img: AppImages.FruitsBasket,
    title:
        'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
  ),
  OnBoardingModel(
    backgroundImg: AppImages.OnboardingFrame2,
    img: AppImages.Pineapple,
    title:
        'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على\n التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
  ),
];
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

abstract class AppConstants {
  static const String username = 'name';

  static const String productCollection = 'products';
  static List<ProductModel> products = [];
  static List<NotificationModel> notifications = [];

  static const String offerCollection = 'offers';
  static const String searchCollection = 'search';
  static const String notificationCollection = 'notifications';

  static const String cartCollection = 'cart';
}
