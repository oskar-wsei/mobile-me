import 'package:flutter/material.dart';
import 'package:mobile_me/core/home/model/user_model.dart';
import 'package:mobile_me/core/home/widgets/info_row_widget.dart';

class CryptoCardWidget extends StatelessWidget {
  final Crypto crypto;
  const CryptoCardWidget({super.key, required this.crypto});

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
              'Crypto',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.monetization_on_outlined),
                SizedBox(width: 5),
                Text(crypto.coin),
              ],
            ),
            SizedBox(height: 5),
            InfoRowWidget(
              label: 'Network',
              value: crypto.network.split(' ')[0],
            ),
          ],
        ),
      ),
    );
  }
}
