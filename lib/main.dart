import 'package:flutter/material.dart';
import 'package:manage_inventory/routes/approutes.dart';
import 'package:manage_inventory/screens/dashboard.dart';
import 'package:manage_inventory/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
