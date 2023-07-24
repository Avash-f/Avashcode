import 'package:book_tickets/screens/dashboard_screen.dart';
import 'package:book_tickets/screens/login_screen.dart';
import 'package:book_tickets/screens/payment_screen.dart';
import 'package:book_tickets/screens/seats_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/seats': (context) => const SeatsScreen(),
        '/payment': (context) => const PaymentScreen(),
      },
    );
  }
}
