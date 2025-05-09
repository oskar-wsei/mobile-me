import 'package:flutter/material.dart';
import 'package:mobile_me/core/products/model/product_model.dart';
import 'package:mobile_me/core/products/widgets/price_bar_widget.dart';
import 'package:mobile_me/core/widgets/image_carousel_widget.dart';
import 'package:mobile_me/core/products/widgets/product_info_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCarouselWidget(images: product.images),
              ProductInfoWidget(product: product),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PriceBarWidget(
        price: product.price,
        discountPercentage: product.discountPercentage,
      ),
    );
  }
}
