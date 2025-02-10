import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

class NotifSuccesScreen extends StatefulWidget {
  const NotifSuccesScreen({super.key});

  @override
  State<NotifSuccesScreen> createState() => _NotifSuccesScreenState();
}

class _NotifSuccesScreenState extends State<NotifSuccesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 24, left: 25, right: 25, top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/traver.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Successfully created an\naccount',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'After this you can explore any place you\nwant. enjoy it!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.goNamed(Routes.home),
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
                    'let s Explore!',
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
