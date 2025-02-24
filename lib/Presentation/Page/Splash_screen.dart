// ignore_for_file: use_build_context_synchronously, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool onboard = false;
  String login = "";
  @override
  cekData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool('isOnboard') != null) {
        onboard = prefs.getBool('isOnboard')!;
        if (prefs.getString("Login") != null) {
          login = prefs.getString("Login")!;
        }
      }
    });
  }

  void initState() {
    print(onboard);
    cekData();
    Future.delayed(
      Duration(seconds: 3),
      () => !onboard
          ? context.goNamed(Routes.onboard)
          : login == ""
              ? context.goNamed(Routes.login)
              : context.goNamed(Routes.home),
    );
    super.initState();
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
