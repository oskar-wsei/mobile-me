import 'package:flutter/material.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final int maxQuantity;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.maxQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final canDecrement = quantity > 1;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade800, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: canDecrement ? onDecrement : null,
            icon: Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$quantity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
