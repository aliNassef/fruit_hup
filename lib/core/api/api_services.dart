import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants.dart';

class ApiServices {
  static CollectionReference products =
      FirebaseFirestore.instance.collection(AppConstants.productCollection);

  CollectionReference offers =
      FirebaseFirestore.instance.collection(AppConstants.offerCollection);

  CollectionReference search =
      FirebaseFirestore.instance.collection(AppConstants.searchCollection);

  getProductsData() async {
    QuerySnapshot querySnapshot = await products.get();
    var data = querySnapshot.docs;
    return data;
  }
  getProductCollection() {
    return products;
  }
  getOffers() async {
    QuerySnapshot querySnapshot = await offers.get();
    var data = querySnapshot.docs;
    return data;
  }

  addQuery({required String val}) async {
    search.add(
      {
        'search': val,
      },
    );
  }

  getQuries() async {
    QuerySnapshot querySnapshot = await search.get();
    var data = querySnapshot.docs;
    return data;
  }

  Future<void> deleteQuery(String docId) async {
    await search.doc(docId).delete();
  }

  deleteAllquries() async {
    final querySnapshot = await search.get();

    for (var doc in querySnapshot.docs) {
      await deleteQuery(doc.id);
    }
  }

  deleteSpecificQuery({required int index}) async {
    final querySnapshot = await search.get();
    var docId = querySnapshot.docs[index].id;
    deleteQuery(docId);
  }
}
