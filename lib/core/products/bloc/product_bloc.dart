import 'package:mobile_me/common/bloc/model_bloc.dart';
import 'package:mobile_me/core/products/model/product_model.dart';
import 'package:mobile_me/core/products/service/product_service.dart';

class ProductBloc extends ModelBloc<ProductModel, ProductService> {
  @override
  final service = ProductService();
}
