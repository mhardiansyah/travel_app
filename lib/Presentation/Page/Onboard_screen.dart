import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      // showSkipButton: true,
      // showNextButton: false,
      // skip: Text(
      //   "skip",
      //   style: GoogleFonts.poppins(
      //       textStyle: TextStyle(
      //     color: Colors.white,
      //   )),
      // ),
      // done: Text(
      //   "Done",
      //   style: GoogleFonts.poppins(
      //       textStyle: TextStyle(
      //     color: Colors.white,
      //   )),
      // ),
      // dotsDecorator: DotsDecorator(
      //   color: Colors.white,
      //   activeColor: Colors.yellow,
      // ),
      // onDone: () {
      //   // On button pressed
      // },
      showSkipButton: true,
      skip: const Text("Skip", style: TextStyle(color: Colors.white)),
      next: const Text("Next", style: TextStyle(color: Colors.white)),
      done: const Text("Done",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
      onDone: () => context.goNamed(Routes.login),
      onSkip: () => context.goNamed(Routes.login),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(50.0, 10.0),
        activeColor: const Color.fromARGB(255, 224, 214, 214),
        color: Colors.white,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      pages: [
        PageViewModel(
            title: "",
            bodyWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/img/white-traver.png",
                    width: 200,
                  ),
                  Text(
                    "Lets explore the world",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 50,
                    )),
                  ),
                  Text(
                    "lets explore the world with us with just a few clicks",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    )),
                  ),
                  // ElevatedButton(onPressed: , child: child)
                ],
              ),
            ),
            decoration: PageDecoration(
                fullScreen: true,
                titlePadding: EdgeInsets.only(
                  bottom: 0,
                ),
                bodyFlex: 1),
            image: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/page1.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [0.7, 1],
                  ),
                ),
              )
            ])),
        PageViewModel(
            title: "",
            bodyWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/img/white-traver.png",
                    width: 200,
                  ),
                  Text(
                    "Lets explore the world",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 50,
                    )),
                  ),
                  Text(
                    "lets explore the world with us with just a few clicks",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    )),
                  ),
                  // ElevatedButton(onPressed: , child: child)
                ],
              ),
            ),
            decoration: PageDecoration(
                fullScreen: true,
                titlePadding: EdgeInsets.only(
                  bottom: 0,
                ),
                bodyFlex: 1),
            image: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/page2.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [0.7, 1],
                  ),
                ),
              )
            ])),
        PageViewModel(
            title: "",
            bodyWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/img/white-traver.png",
                    width: 200,
                  ),
                  Text(
                    "Lets explore the world",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 50,
                    )),
                  ),
                  Text(
                    "lets explore the world with us with just a few clicks",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    )),
                  ),
                  // ElevatedButton(onPressed: , child: child)
                ],
              ),
            ),
            decoration: PageDecoration(
                fullScreen: true,
                titlePadding: EdgeInsets.only(
                  bottom: 0,
                ),
                bodyFlex: 1),
            image: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/page3.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    stops: [0.7, 1],
                  ),
                ),
              )
            ]))
      ],
    ));
  }
}
