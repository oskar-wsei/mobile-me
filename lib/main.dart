import 'package:flutter/material.dart';
import 'package:mobile_me/application.dart';
import 'package:mobile_me/common/service/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const Application());
}
