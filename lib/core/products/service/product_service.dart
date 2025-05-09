import 'package:mobile_me/common/model/model_service.dart';
import 'package:mobile_me/core/products/model/product_model.dart';

class ProductService extends ModelService<ProductModel> {
  @override
  final path = 'products';

  @override
  ProductModel fromMap(Map<String, dynamic> map) {
    return ProductModel.fromMap(map);
  }
}
