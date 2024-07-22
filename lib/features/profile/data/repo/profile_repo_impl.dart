import 'dart:developer';

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
    try {
      await getIt.get<CacheHelper>().put(
            key: AppConstants.username,
            value: name,
          );
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> changeUserPass(String newPass) async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }
      await user.updatePassword(newPass);
    } catch (e) {
      log(e.toString());
    }
  }
  
  @override
  Future<void> addToFav({required int index}) async{
   
  }
}
