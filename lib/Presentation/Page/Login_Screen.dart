import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? selectedIndex = false;
  bool _obscureText = true; // Untuk mengontrol visibilitas password

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/traver.png', height: 50),
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
            SizedBox(height: 20),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Password',
                // labelStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: togglePasswordVisibility,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text('Remember me'),
                  ],
                ),
                InkWell(
                  onTap: () => context.goNamed(Routes.forgot_password),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.yellow),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.goNamed(Routes.register),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
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
                    'Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/img/ig.png', height: 30),
                SizedBox(width: 20),
                Image.asset('assets/img/google.png', height: 30),
                SizedBox(width: 20),
                Image.asset('assets/img/fb.png', height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
