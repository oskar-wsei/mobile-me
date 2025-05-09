import 'package:flutter/material.dart';
import 'package:mobile_me/core/home/model/user_model.dart';
import 'package:mobile_me/core/home/widgets/info_row_widget.dart';

class CompanyCardWidget extends StatelessWidget {
  final Company company;
  const CompanyCardWidget({super.key, required this.company});

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
              'Company',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            InfoRowWidget(label: 'Department', value: company.department),
            SizedBox(height: 10),
            InfoRowWidget(label: 'Title', value: company.title),
          ],
        ),
      ),
    );
  }
}
