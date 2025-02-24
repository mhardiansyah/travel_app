import 'dart:convert'; // Add this import

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

class prossesAuth {
  var url = dotenv.env['base_url'];

  Future register(BuildContext context, String name, String email,
      String password, String confirmPassword) async {
    Uri urlRegister = Uri.parse("$url/auth/register/");
    //validasi before debuging
    print("Nama: $name");
    print("Email: $email");
    print("Password: $password");
    print("Konfirmasi Password: $confirmPassword");
    var response = await http.post(urlRegister,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword
        }));
    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      print("Masuk ke if statement");
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Registration Successful"),
            content: Text("Silahkan cek email anda"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog

                  context.goNamed(Routes.otp_verification, extra: email);
                },
              ),
            ],
          );
        },
      );
    } else {
      print("gagal");
      print(response.body);
      return false;
    }
  }

  Future verify(BuildContext context, String email, String otp) async {
    Uri urlVerification = Uri.parse("$url/auth/verify/");
    var response = await http.post(urlVerification,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email, 'otp': otp}));

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    print("kode: ${otp}");
    if (response.statusCode == 200) {
      print("masuk ke if");
      return context.goNamed(Routes.notif_success);
    } else {
      print("gagal");
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("kode otp nya salah"),
        ),
      );
    }
  }

  Future login(BuildContext context, String email, String password) async {
    Uri urlLogin = Uri.parse("http://172.10.50.31:4000/auth/login/");
    var response = await http.post(urlLogin,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}));

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      print("masuk ke if");
      // var responseData = jsonDecode(response.body);
      // String token = responseData['token'];
      // print("Token: $token");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('Login', response.body);
      print("Login berhasil");
      return context.goNamed(Routes.home);
    } else {
      print("gagal");
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email atau password salah"),
        ),
      );
    }
  }

  ///forgot password

  Future forgotPassword(BuildContext context, String email) async {
    Uri urlForgotPassword =
        Uri.parse("http://172.10.50.90:4000/auth/forgotPassword");
    var response = await http.post(urlForgotPassword,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'email': email}));

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      print("masuk ke if");
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Email telah terkirim"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.goNamed(
                  Routes.password_notif_success,
                );
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      print("gagal");
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email tidak terdaftar atau tidak valid"),
        ),
      );
    }
  }

  /// new password
  Future newPassword(BuildContext context, String email, String password,
      String confirmPassword) async {
    Uri urlNewPassword =
        Uri.parse("http://172.10.10.188:4000/auth/reset-password");
    var response = await http.post(urlNewPassword,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'newPassword': password,
          'newConfirmPassword': confirmPassword
        }));

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");
    if (response.statusCode == 200) {
      print("masuk ke if");
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Password berhasil diubah"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.goNamed(Routes.otp_verification, extra: email);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      print("gagal");
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password tidak sama"),
        ),
      );
    }
  }
}
