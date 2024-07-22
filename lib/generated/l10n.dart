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

  /// `تسجيل دخول`
  String get login {
    return Intl.message(
      'تسجيل دخول',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني`
  String get email {
    return Intl.message(
      'البريد الإلكتروني',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get password {
    return Intl.message(
      'كلمة المرور',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `نسيت كلمة المرور؟`
  String get forgetPass {
    return Intl.message(
      'نسيت كلمة المرور؟',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `لا تمتلك حساب؟`
  String get haveAccount {
    return Intl.message(
      'لا تمتلك حساب؟',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `قم بانشاء حساب`
  String get createNewAccount {
    return Intl.message(
      'قم بانشاء حساب',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `أو`
  String get or {
    return Intl.message(
      'أو',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل بواسطة جوجل`
  String get signwithgoogle {
    return Intl.message(
      'تسجيل بواسطة جوجل',
      name: 'signwithgoogle',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل بواسطة أبل`
  String get signwithapple {
    return Intl.message(
      'تسجيل بواسطة أبل',
      name: 'signwithapple',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل بواسطة فيسبوك`
  String get signwithfacebook {
    return Intl.message(
      'تسجيل بواسطة فيسبوك',
      name: 'signwithfacebook',
      desc: '',
      args: [],
    );
  }

  /// `حساب جديد`
  String get newaccount {
    return Intl.message(
      'حساب جديد',
      name: 'newaccount',
      desc: '',
      args: [],
    );
  }

  /// `الاسم كامل`
  String get fullname {
    return Intl.message(
      'الاسم كامل',
      name: 'fullname',
      desc: '',
      args: [],
    );
  }

  /// ` من خلال إنشاء حساب ، فإنك توافق على `
  String get fromRules {
    return Intl.message(
      ' من خلال إنشاء حساب ، فإنك توافق على ',
      name: 'fromRules',
      desc: '',
      args: [],
    );
  }

  /// ` الشروط \nوالأحكام الخاصة بنا`
  String get termsAndCondation {
    return Intl.message(
      ' الشروط \nوالأحكام الخاصة بنا',
      name: 'termsAndCondation',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب جديد`
  String get signUp {
    return Intl.message(
      'إنشاء حساب جديد',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// ` تمتلك حساب بالفعل؟ `
  String get HaveAccount {
    return Intl.message(
      ' تمتلك حساب بالفعل؟ ',
      name: 'HaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `صباح الخير !..`
  String get goodMorning {
    return Intl.message(
      'صباح الخير !..',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `ابحث عن.......`
  String get searchFor {
    return Intl.message(
      'ابحث عن.......',
      name: 'searchFor',
      desc: '',
      args: [],
    );
  }

  /// `الأكثر مبيعًا`
  String get bestSeller {
    return Intl.message(
      'الأكثر مبيعًا',
      name: 'bestSeller',
      desc: '',
      args: [],
    );
  }

  /// `المزيد`
  String get lot {
    return Intl.message(
      'المزيد',
      name: 'lot',
      desc: '',
      args: [],
    );
  }

  /// `البحث`
  String get search {
    return Intl.message(
      'البحث',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `الاشعارات`
  String get notification {
    return Intl.message(
      'الاشعارات',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `المنتجات`
  String get products {
    return Intl.message(
      'المنتجات',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `منتجاتنا`
  String get ourProducts {
    return Intl.message(
      'منتجاتنا',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `تصنيف حسب :`
  String get filter {
    return Intl.message(
      'تصنيف حسب :',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `السعر :`
  String get priceRange {
    return Intl.message(
      'السعر :',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `الي`
  String get to {
    return Intl.message(
      'الي',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `نتائج`
  String get result {
    return Intl.message(
      'نتائج',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `السلة`
  String get cart {
    return Intl.message(
      'السلة',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `حسابي`
  String get myProfile {
    return Intl.message(
      'حسابي',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `عام`
  String get public {
    return Intl.message(
      'عام',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `الملف الشخصي`
  String get personalAccount {
    return Intl.message(
      'الملف الشخصي',
      name: 'personalAccount',
      desc: '',
      args: [],
    );
  }

  /// `طلباتي`
  String get myOrders {
    return Intl.message(
      'طلباتي',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `المدفوعات`
  String get payments {
    return Intl.message(
      'المدفوعات',
      name: 'payments',
      desc: '',
      args: [],
    );
  }

  /// `المفضلة`
  String get favorites {
    return Intl.message(
      'المفضلة',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `من نحن`
  String get whoAreWe {
    return Intl.message(
      'من نحن',
      name: 'whoAreWe',
      desc: '',
      args: [],
    );
  }

  /// `المساعدة`
  String get help {
    return Intl.message(
      'المساعدة',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `الوضع`
  String get theme {
    return Intl.message(
      'الوضع',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الخروج`
  String get signOut {
    return Intl.message(
      'تسجيل الخروج',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `المعلومات الشخصية`
  String get personalInfo {
    return Intl.message(
      'المعلومات الشخصية',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `تغيير كلمة المرور`
  String get changePass {
    return Intl.message(
      'تغيير كلمة المرور',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `حفظ التغييرات`
  String get saveChanges {
    return Intl.message(
      'حفظ التغييرات',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الحالي`
  String get currentPass {
    return Intl.message(
      'كلمة المرور الحالي',
      name: 'currentPass',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور الجديدة`
  String get newPass {
    return Intl.message(
      'كلمة المرور الجديدة',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد كلمة المرور الجديده`
  String get confirmPass {
    return Intl.message(
      'تأكيد كلمة المرور الجديده',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `هل تريد تسجيل الخروج؟`
  String get doYOuWantToLogout {
    return Intl.message(
      'هل تريد تسجيل الخروج؟',
      name: 'doYOuWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `تأكيد`
  String get confirm {
    return Intl.message(
      'تأكيد',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `لا أرغب`
  String get cancel {
    return Intl.message(
      'لا أرغب',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `المفضلة`
  String get fav {
    return Intl.message(
      'المفضلة',
      name: 'fav',
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
