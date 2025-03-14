import 'package:flutter/material.dart';
import 'Onboarding.dart'; // Import the OnboardingPage
import 'dashboard.dart'; // Import the DashboardPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LalaJi Ledgers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(), // Set the RegistrationPage as the starting screen
    );
  }
}