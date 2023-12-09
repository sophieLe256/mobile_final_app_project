import 'DUMMY_MODELS.dart';

abstract class BaseProductRepo {
  Stream<List<Product>> getAllProducts();
}
