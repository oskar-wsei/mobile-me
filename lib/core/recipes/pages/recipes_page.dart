import 'package:flutter/material.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(child: Center(child: Text('Recipes page'))),
    );
  }
}
