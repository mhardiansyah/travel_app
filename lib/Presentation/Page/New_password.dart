import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';
import 'package:travel_app/Core/UseCase/auth.dart';

class NewPassword extends StatefulWidget {
  final email;
  const NewPassword({super.key, this.email});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _obscureText = true; // Untuk mengontrol visibilitas password

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Your Password',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Create New Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextField(
              controller: password,
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
            SizedBox(height: 20),
            TextField(
              controller: confirmPassword,
              obscureText: _obscureText,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Confrim Password',
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
            const SizedBox(
              height: 10,
            ),
            const Text(
              "your password must include at least one symbol and be 8 or more character long",
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => prossesAuth().newPassword(
                  context, widget.email, password.text, confirmPassword.text),
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
                    'Save',
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
