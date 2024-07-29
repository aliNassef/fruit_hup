import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/generated/l10n.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../cart/presentation/views/cart_view.dart';
import '../../../../products/presentation/views/products_view.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../home/presentation/views/home_view.dart';
import 'layout_active_icon.dart';

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const ProductsView(),
      const CartView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: LayoutActiveIcon(
          img: AppImages.home_active,
        ),
        inactiveIcon: SvgPicture.asset(
          AppImages.home,
        ),
        title: (S.of(context).main),
        textStyle: AppStyles.textStyle11SB.copyWith(
          color: AppColors.mainColor,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: AppColors.mainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(
          AppImages.categories,
        ),
        iconSize: 30,
        icon: LayoutActiveIcon(img: AppImages.categories_active),
        activeColorSecondary: AppColors.mainColor,
        title: (S.of(context).productList),
        textStyle: AppStyles.textStyle11SB.copyWith(
          color: AppColors.mainColor,
        ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(
          AppImages.cart,
        ),
        iconSize: 30,
        icon: LayoutActiveIcon(img: AppImages.cart_active),
        activeColorSecondary: AppColors.mainColor,
        title: (S.of(context).shoppingCart),
        textStyle: AppStyles.textStyle11SB.copyWith(
          color: AppColors.mainColor,
        ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: SvgPicture.asset(AppImages.profile),
        iconSize: 30,
        activeColorSecondary: AppColors.mainColor,
        icon: LayoutActiveIcon(img: AppImages.profile_active),
        title: (S.of(context).myProfile),
        textStyle: AppStyles.textStyle11SB.copyWith(
          color: AppColors.mainColor,
        ),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: buildNavBarDecoration(),
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle:
          NavBarStyle.style7, // Choose the nav bar style with this property
    );
  }

  NavBarDecoration buildNavBarDecoration() {
    return NavBarDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 7,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
      colorBehindNavBar: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );
  }
}
