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
  static const int cardPaymentMethodIntegrationId = 4564350;

  static const kConstantPayMobKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1Rjek5EZzVMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkud2JJUVVfalBybWNMQXhCeTF1U3VLVTU0X0R1czk4VHByYlB4ekc2S0lDZWtvbDdWTVRVZ18ycEZTRzVnR1dndFEtcER1azdidndFZWRpQU11a3Rqdmc';
  static String isLoggedOnce = 'isLoggedOnce';
  static const String username = 'name';
  static const String useremail = 'email';
  static const String userImage = 'image';
  static const String userPass = 'password';
  static const String productCollection = 'products';
  static const String favoriteProductsCollection = 'favoriteProducts';
  static const String favCollection = 'favourites';
  static List<ProductModel> products = [];
  static List<NotificationModel> notifications = [];
  static const String offerCollection = 'offers';
  static const String searchCollection = 'search';
  static const String notificationCollection = 'notifications';
  static const String orderCollection = 'order';
  static const String cartCollection = 'cart';
  static const String userAddrress = 'address';
  static const String userCity = 'city';
  static const String userDepartmentNumber = 'departmentNumber';
  static String? amountOfPayment;
}
