import 'package:flutter/material.dart';
import 'package:mobile_me/core/products/model/product_model.dart';
import 'package:mobile_me/core/products/widgets/review_widget.dart';
import 'package:mobile_me/core/products/widgets/quantity_selector.dart';
import 'package:mobile_me/core/widgets/rating_widget.dart';

class ProductInfoWidget extends StatelessWidget {
  final ProductModel product;
  const ProductInfoWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.brand != null)
            Text(
              product.brand ?? 'Unknown Brand',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, height: 1.2),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    for (final tag in product.tags)
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Badge(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          label: Text(tag),
                          backgroundColor: Colors.indigoAccent,
                          textColor: Colors.white,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 10),
                Text(product.description, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              QuantitySelector(
                quantity: 4,
                onIncrement: () {},
                onDecrement: () {},
                maxQuantity: product.stock,
              ),
              SizedBox(width: 10),
              Text('from ${product.stock}', style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 10),
          Text(
            product.shippingInformation,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 10),
          Divider(),
          Text(
            'Rating',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          RatingWidget(rating: product.rating),
          SizedBox(height: 20),
          Text(
            'Comments',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          for (final review in product.reviews) ReviewWidget(review: review),
        ],
      ),
    );
  }
}
