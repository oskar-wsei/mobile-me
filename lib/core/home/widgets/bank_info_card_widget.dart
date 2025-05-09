import 'package:flutter/material.dart';
import 'package:mobile_me/core/home/model/user_model.dart';
import 'package:mobile_me/core/home/widgets/info_row_widget.dart';

class BankInfoCardWidget extends StatelessWidget {
  final Bank bank;
  const BankInfoCardWidget({super.key, required this.bank});

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
              'Bank Info',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(bank.cardNumber),
            SizedBox(height: 5),
            InfoRowWidget(label: 'Card Type', value: bank.cardType),
          ],
        ),
      ),
    );
  }
}
