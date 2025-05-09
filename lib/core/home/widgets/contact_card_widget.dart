import 'package:flutter/material.dart';
import 'package:mobile_me/core/home/model/user_model.dart';

class ContactCardWidget extends StatelessWidget {
  final UserModel user;

  const ContactCardWidget({super.key, required this.user});

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
              'Contact',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email_outlined),
                SizedBox(width: 10),
                Text(user.email),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone_outlined),
                SizedBox(width: 10),
                Text(user.phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
