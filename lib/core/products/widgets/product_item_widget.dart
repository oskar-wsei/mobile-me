import 'package:flutter/material.dart';
import 'package:mobile_me/core/products/model/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;

  const ProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.thumbnail),
          SizedBox(height: 12),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 24,
                  height: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Text(product.description),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Column(
              spacing: 16,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    for (final tag in product.tags)
                      Text('#$tag', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: product.discountPercentage > 0 ? Colors.grey : null,
                    decoration:
                        product.discountPercentage > 0
                            ? TextDecoration.lineThrough
                            : null,
                  ),
                ),
                if (product.discountPercentage > 0) SizedBox(width: 16),
                Text(
                  '\$${_round(product.price - (product.price * product.discountPercentage / 100))}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _round(double value) {
    return (value * 100).round() / 100;
  }
}
