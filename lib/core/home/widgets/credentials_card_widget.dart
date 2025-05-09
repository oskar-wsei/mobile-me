import 'package:flutter/material.dart';
import 'package:mobile_me/core/home/model/user_model.dart';
import 'package:mobile_me/core/home/widgets/info_row_widget.dart';

class CredentialsCardWidget extends StatelessWidget {
  final UserModel user;
  const CredentialsCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: Colors.indigo,
              child: Text(
                _createInitials('${user.firstName} ${user.lastName}'),
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  InfoRowWidget(label: 'Age', value: user.age.toString()),
                  const SizedBox(height: 8),
                  InfoRowWidget(label: 'Date of Birth', value: '1410'),
                  const SizedBox(height: 8),
                  InfoRowWidget(label: 'Gender', value: 'female'),
                  const SizedBox(height: 8),
                  InfoRowWidget(label: 'Blood Type', value: 'AB'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _createInitials(String name) {
    return name.trim().split(' ').map((e) => e[0]).take(2).join().toUpperCase();
  }
}
