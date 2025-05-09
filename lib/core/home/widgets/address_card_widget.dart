import 'package:flutter/material.dart';
import 'package:mobile_me/core/home/model/user_model.dart';

class AddressCardWidget extends StatelessWidget {
  final Address address;
  const AddressCardWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '${address.address} ${address.city}, ${address.state} ${address.postalCode}',
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
