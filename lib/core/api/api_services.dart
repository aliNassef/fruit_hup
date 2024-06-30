import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hup/constants.dart';

class ApiServices {
  CollectionReference products =
      FirebaseFirestore.instance.collection(AppConstants.productCollection);

  CollectionReference offers =
      FirebaseFirestore.instance.collection(AppConstants.offerCollection);

  getProductsData() async {
    QuerySnapshot querySnapshot = await products.get();
    var data = querySnapshot.docs;
    return data;
  }

  getOffers() async {
    QuerySnapshot querySnapshot = await offers.get();
    var data = querySnapshot.docs;
    return data;
  }
}
