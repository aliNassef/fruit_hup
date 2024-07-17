import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hup/constants.dart';

import '../../../../core/error/failure.dart';
import '../model/cart_model.dart';
import 'cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final cartCollection =
      FirebaseFirestore.instance.collection(AppConstants.cartCollection);
  @override
  addProductToCart({
    required int quantity,
    required String img,
    required num price,
    required String name,
    required String measure,
  }) async {
    try {
      cartCollection.add({
        'quantity': quantity,
        'img': img,
        'price': price,
        'name': name,
        'measure': measure,
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  removeProductFromCart({required int index}) async {
    try {
      var data = await cartCollection.get();
      var ddocId = data.docs[index].id;
      await cartCollection.doc(ddocId).delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Stream<Either<List<CartModel>, dynamic>> getCartitems() {
    try {
      return cartCollection.snapshots().map((snapshot) {
        List<CartModel> cartItems =
            snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList();
        return Left(cartItems);
      }).handleError((error) {
        return Right(Failure(errMessage: error.toString()));
      });
    } catch (e) {
      return Stream.value(Right(Failure(errMessage: e.toString())));
    }
  }
}
