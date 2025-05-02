import 'package:mobile_me/core/products/model/product_model.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;

  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState({required this.message});
}
