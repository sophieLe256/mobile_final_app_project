import 'DUMMY_PRODUCTS.dart';

abstract class BaseProductRepo {
  Stream<List<Product>> getAllProducts();
}
