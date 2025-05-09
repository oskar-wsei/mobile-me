import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
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
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity = widget.quantity;

  @override
  Widget build(BuildContext context) {
    final canDecrement = _quantity > 1;
    final canIncrement = _quantity < widget.maxQuantity;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade800, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: canDecrement ? _decrement : null,
            icon: Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '$_quantity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(onPressed: canIncrement ? _increment : null, icon: Icon(Icons.add)),
        ],
      ),
    );
  }

  void _decrement() {
    _quantity--;
    widget.onDecrement();
    setState(() {});
  }

  void _increment() {
    _quantity++;
    widget.onIncrement();
    setState(() {});
  }
}
