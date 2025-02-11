import 'dart:convert'; // Add this import

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
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
}
