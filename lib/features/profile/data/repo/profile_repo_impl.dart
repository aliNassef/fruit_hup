import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/cache/cache_helper.dart';
import 'package:fruit_hup/core/service_locator.dart';

import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> changeUserName(String name) async {
    await getIt
        .get<CacheHelper>()
        .saveData(key: AppConstants.username, value: name);
  }
}
