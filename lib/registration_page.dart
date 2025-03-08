import 'package:flutter/material.dart';
import 'package:inventory/dashboard.dart'; // Make sure this path is correct

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LalaJi Ledgers'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding for spacing
          child: Image.asset(
            'assets/images/Rupee.jpg', // Corrected path to assets/images folder
            fit: BoxFit.cover, // Makes sure the image scales properly
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add the image at the top, centered
            Center(
              child: Image.asset(
                'assets/images/Lalaji.webp', // Corrected path to assets/images folder
                height: 150,  // You can adjust the height as needed
                fit: BoxFit.contain, // Ensures the image is contained within the given size
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to LalaJi Ledgers Setup',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Start your Business Journey with ease.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Choose a method to proceed with registration.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality for phone registration
              },
              child: Text('Continue with Phone'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality for email registration
              },
              child: Text('Continue with Email'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'New to LalaJi Ledgers? Let’s get you onboard :)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to Dashboard after clicking on Let's Get Started
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text('Let’s Get Started'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}