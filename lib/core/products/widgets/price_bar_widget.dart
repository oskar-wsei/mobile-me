import 'package:flutter/material.dart';
import 'package:mobile_me/common/utils/math_utils.dart';

class PriceBarWidget extends StatelessWidget {
  final double price;
  final double discountPercentage;

  const PriceBarWidget({
    super.key,
    required this.price,
    required this.discountPercentage,
  });

  bool get _hasDiscount => discountPercentage > 0;
  double get _discountedPrice =>
      MathUtils.round(price - (price * discountPercentage / 100));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[700],
      height: 110,
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$$price',
                style: TextStyle(
                  fontSize: _hasDiscount ? 16 : 32,
                  decoration: _hasDiscount ? TextDecoration.lineThrough : null,
                  color: _hasDiscount ? Colors.grey : Colors.white,
                ),
              ),
              if (_hasDiscount)
                Text(
                  '\$${MathUtils.round(_discountedPrice)}',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
            ],
          ),
          FilledButton.icon(
            label: Text('Add to cart', style: const TextStyle(fontSize: 16.0)),
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_rounded),
            style: ButtonStyle(
              iconSize: WidgetStateProperty.all(24.0),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
