import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hup/constants.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';

class ApiServices {
  CollectionReference products =
      FirebaseFirestore.instance.collection(AppConstants.productCollection);
  // products . -> docs -> product.fromjson(docs[i]);

  getData() async {
    QuerySnapshot querySnapshot = await products.get();
    var data = querySnapshot.docs;
    AppConstants.products = [];
    for (var item in data) {
      AppConstants.products.add(ProductModel.fromJson(item));
    }

    print(AppConstants.products.length.toString());
    print(AppConstants.products[0].name);
  }
}
