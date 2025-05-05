import 'package:flutter/material.dart';
import 'package:mobile_me/core/products/model/product_model.dart';
import 'package:mobile_me/core/products/widgets/price_bar_widget.dart';
import 'package:mobile_me/core/widgets/image_carousel_widget.dart';
import 'package:mobile_me/core/products/widgets/product_info_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
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
              ImageCarouselWidget(images: widget.product.images),
              SizedBox(height: 20),
              ProductInfoWidget(product: widget.product),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PriceBarWidget(
        price: widget.product.price,
        discountPercentage: widget.product.discountPercentage,
      ),
    );
  }
}
