import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';
import 'package:mobile_app_project/product/base_product_repo.dart';

class ProductRepo extends BaseProductRepo {
  final FirebaseFirestore store;

  ProductRepo({FirebaseFirestore? firebaseFirestore})
      : store = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return store.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((docs) => Product.fromSnapshot(docs)).toList();
    });
  }
}
