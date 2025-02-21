import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import the Dashboard screen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(), // Set the DashboardPage as the main screen
    );
  }
}