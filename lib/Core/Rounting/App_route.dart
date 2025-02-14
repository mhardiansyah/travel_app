import 'package:go_router/go_router.dart';
import 'package:travel_app/Presentation/Page/Forgot_Password_Screen.dart';
import 'package:travel_app/Presentation/Page/Home.dart';
import 'package:travel_app/Presentation/Page/Login_Screen.dart';
import 'package:travel_app/Presentation/Page/New_password.dart';
import 'package:travel_app/Presentation/Page/Notif_succes_screen.dart';
import 'package:travel_app/Presentation/Page/OTP_verification.dart';
import 'package:travel_app/Presentation/Page/Onboard_screen.dart';
import 'package:travel_app/Presentation/Page/Register_Screen.dart';
import 'package:travel_app/Presentation/Page/Splash_screen.dart';
import 'package:travel_app/Presentation/Page/password_notif_success_screen.dart';

part 'Route_name.dart';

final appRoute = GoRouter(routes: [
  GoRoute(
    path: '/home',
    name: Routes.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/',
    name: Routes.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: '/onboard',
    name: Routes.onboard,
    builder: (context, state) => const OnboardScreen(),
  ),
  GoRoute(
    path: '/login',
    name: Routes.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/register',
    name: Routes.register,
    builder: (context, state) => const RegisterScreen(),
  ),
  // GoRoute(
  //     path: '/forgot_password',
  //     name: Routes.forgot_password,
  //     builder: (context, state) {
  //       final email = state.extra as String;
  //       return OtpVerification(email: email);
  //     }),

  GoRoute(
    path: '/forgot_password',
    name: Routes.forgot_password,
    builder: (context, state) => const ForgotPasswordScreen(),
  ),
  GoRoute(
    path: '/otp_verification',
    name: Routes.otp_verification,
    builder: (context, state) {
      final email = state.extra as String;
      return OtpVerification(email: email);
    },
  ),
  // GoRoute(
  //   path: '/new_password',
  //   name: Routes.new_password,
  //   builder: (context, state) => NewPassword(),
  // ),
  GoRoute(
      path: '/new_password',
      name: Routes.new_password,
      builder: (context, state) {
        final email = state.extra as String;
        return NewPassword(email: email);
      }),
  GoRoute(
    path: '/notif_success',
    name: Routes.notif_success,
    builder: (context, state) => NotifSuccesScreen(),
  ),
  GoRoute(
    path: '/password_notif_success',
    name: Routes.password_notif_success,
    builder: (context, state) => PasswordNotifSuccessScreen(),
  ),
]);
