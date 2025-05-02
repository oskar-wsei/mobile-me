import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/products/bloc/product_event.dart';
import 'package:mobile_me/core/products/bloc/product_state.dart';
import 'package:mobile_me/core/products/service/product_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final _service = ProductService();

  ProductBloc() : super(ProductInitialState()) {
    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());

      final response = await _service.list();

      response.fold(
        (error) => emit(ProductErrorState(message: error.message)),
        (products) => emit(ProductLoadedState(products: products)),
      );
    });

    add(ProductLoadEvent());
  }
}
