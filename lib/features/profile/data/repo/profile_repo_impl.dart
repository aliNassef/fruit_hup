import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/core/cache/cache_helper.dart';
import 'package:fruit_hup/core/service_locator.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';

import '../../../../core/error/failure.dart';
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

  final favCollection =
      FirebaseFirestore.instance.collection(AppConstants.favCollection);

  addProducToFav({required ProductModel product}) async {
    try {
      await favCollection.add({
        'id': product.id,
        'image': product.image,
        'name': product.name,
        'price': product.price,
        'count': product.count,
        "measure": product.measure,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Stream<Either<List<ProductModel>, dynamic>> getFavProducts() {
    try {
      return favCollection.snapshots().map((snapshot) {
        List<ProductModel> favItems = snapshot.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();
        return Left(favItems);
      }).handleError((error) {
        log(error.toString());
        return Right(Failure(errMessage: error.toString()));
      });
    } catch (e) {
      return Stream.value(Right(Failure(errMessage: e.toString())));
    }
  }

  @override
  Future<void> removeProductFromFav({required int index}) async {
    try {
      var data = await favCollection.get();
      for (var element in data.docs) {
        if (element['id'] == AppConstants.products[index].id) {
          await favCollection.doc(element.id).delete();
          break;
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
