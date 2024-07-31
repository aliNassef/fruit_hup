// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgetPass {
    return Intl.message(
      'Forgot Password?',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get haveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get createNewAccount {
    return Intl.message(
      'Create a new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signwithgoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signwithgoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get signwithapple {
    return Intl.message(
      'Sign in with Apple',
      name: 'signwithapple',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get signwithfacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'signwithfacebook',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newaccount {
    return Intl.message(
      'New Account',
      name: 'newaccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullname {
    return Intl.message(
      'Full Name',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our`
  String get fromRules {
    return Intl.message(
      'By creating an account, you agree to our',
      name: 'fromRules',
      desc: '',
      args: [],
    );
  }

  /// `Terms \nand Conditions`
  String get termsAndCondation {
    return Intl.message(
      'Terms \nand Conditions',
      name: 'termsAndCondation',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get HaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'HaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning!`
  String get goodMorning {
    return Intl.message(
      'Good Morning!',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Search for...`
  String get searchFor {
    return Intl.message(
      'Search for...',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get bestSeller {
    return Intl.message(
      'Best Seller',
      name: 'bestSeller',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get lot {
    return Intl.message(
      'More',
      name: 'lot',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Our Products`
  String get ourProducts {
    return Intl.message(
      'Our Products',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `Sort by:`
  String get filter {
    return Intl.message(
      'Sort by:',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Price:`
  String get priceRange {
    return Intl.message(
      'Price:',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get result {
    return Intl.message(
      'Results',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get public {
    return Intl.message(
      'Public',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `Personal Account`
  String get personalAccount {
    return Intl.message(
      'Personal Account',
      name: 'personalAccount',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get payments {
    return Intl.message(
      'Payments',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Who Are We`
  String get whoAreWe {
    return Intl.message(
      'Who Are We',
      name: 'whoAreWe',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePass {
    return Intl.message(
      'Change Password',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get saveChanges {
    return Intl.message(
      'Save Changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPass {
    return Intl.message(
      'Current Password',
      name: 'currentPass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPass {
    return Intl.message(
      'New Password',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmPass {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get doYOuWantToLogout {
    return Intl.message(
      'Do you want to log out?',
      name: 'doYOuWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get fav {
    return Intl.message(
      'Favorites',
      name: 'fav',
      desc: '',
      args: [],
    );
  }

  /// `Sorry... this information is not available at the moment`
  String get sorryInfonotfound {
    return Intl.message(
      'Sorry... this information is not available at the moment',
      name: 'sorryInfonotfound',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get lastSearchInfo {
    return Intl.message(
      'Recent Searches',
      name: 'lastSearchInfo',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get deleteAll {
    return Intl.message(
      'Delete All',
      name: 'deleteAll',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get productList {
    return Intl.message(
      'Products',
      name: 'productList',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lang {
    return Intl.message(
      'English',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get ar {
    return Intl.message(
      'العربية',
      name: 'ar',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
