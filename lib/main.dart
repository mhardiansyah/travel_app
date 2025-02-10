import 'package:flutter/material.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
    );
  }
}