import 'dart:async';
import 'package:mobile_app_project/product/product_repo.dart';
import "package:equatable/equatable.dart";
import "package:bloc/bloc.dart";
import 'package:mobile_app_project/product/DUMMY_MODELS.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepo productRepo})
      : _productRepo = productRepo,
        super(ProductLoading()) {
    on<LoadProduct>(_onLoadProduct);
    on<UpdateProduct>(_onUpdateProduct);
  }

  void _onLoadProduct(event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription = _productRepo
        .getAllProducts()
        .listen((products) => add(UpdateProduct(products)));
  }

  void _onUpdateProduct(event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }
}
