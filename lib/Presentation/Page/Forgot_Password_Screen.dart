import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Input Your Email',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Forgot Your Password?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 36),
            ElevatedButton(
              onPressed: () => context.goNamed(Routes.new_password),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFCD240),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
