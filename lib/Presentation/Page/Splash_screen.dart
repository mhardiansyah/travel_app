// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () => context.goNamed(Routes.onboard),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Center(
              child: Image.asset(
                "assets/img/traver.png",
                width: 200,
                height: 200,
              ),
            ),
          ),
          const Text("Version 1.0.0"),
        ],
      ),
    );
  }
}
