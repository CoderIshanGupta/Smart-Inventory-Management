import 'package:flutter/material.dart';
import 'package:inventory/dashboard.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set a default background color
      appBar: AppBar(
        title: Text('LalaJi Ledgers'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding for spacing
          child: Image.asset(
            'assets/images/Rupee.jpg', // Use the image from assets
            fit: BoxFit.cover, // Ensures the image scales properly
          ),
        ),
        backgroundColor: Colors.white, // Set app bar background color
        elevation: 2,
      ),
      body: SingleChildScrollView(  // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the column
            children: [
              // Add the image at the top, centered
              Center(
                child: Image.asset(
                  'assets/images/Lalaji.webp',
                  height: 150, // Adjust the height of the image
                  fit: BoxFit.contain, // Ensure the image fits inside the given size
                ),
              ),
              SizedBox(height: 16),
              // Title Text
              Text(
                'Welcome to LalaJi Ledgers Setup',
                textAlign: TextAlign.center,  // Center the title
                style: TextStyle(
                  fontSize: 24, // Font size for the title
                  fontWeight: FontWeight.bold, // Bold font for the title
                  color: Colors.black, // Color for the text (black)
                ),
              ),
              SizedBox(height: 16),
              // Description text
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'Start your Business Journey with ease. \nChoose a method to proceed with registration.',
                  textAlign: TextAlign.center, // Center the description text
                  style: TextStyle(
                    fontSize: 16, // Font size for description
                    fontWeight: FontWeight.bold, // Bold font for description
                    color: Colors.black, // Black color for the text
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Continue with Phone button
              ElevatedButton(
                onPressed: () {
                  // Add functionality for phone registration
                },
                child: Text(
                  'Continue with Phone',
                  style: TextStyle(color: Colors.white),  // Text color inside the button
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50), // Set a custom size for the button
                  backgroundColor: Colors.blueAccent, // Button background color
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal, // Lighter text for the button
                    fontSize: 18, // Larger text size for better visibility
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the button
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Continue with Email button
              ElevatedButton(
                onPressed: () {
                  // Add functionality for email registration
                },
                child: Text(
                  'Continue with Email',
                  style: TextStyle(color: Colors.white),  // Text color inside the button
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50), // Set a custom size for the button
                  backgroundColor: Colors.blueAccent, // Button background color
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal, // Lighter text for the button
                    fontSize: 18, // Larger text size for better visibility
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the button
                  ),
                ),
              ),
              SizedBox(height: 24),
              // Text for new to app prompt
              Text(
                'New to LalaJi Ledgers? Let’s get you onboard :)',
                textAlign: TextAlign.center, // Center the text
                style: TextStyle(
                  fontSize: 16, // Font size for the prompt
                  fontWeight: FontWeight.bold, // Bold font for the prompt
                  color: Colors.black, // Black color for the text
                ),
              ),
              SizedBox(height: 16),
              // Let's Get Started button
              ElevatedButton(
                onPressed: () {
                  // Navigate to Dashboard after clicking on Let's Get Started
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                },
                child: Text(
                  'Let’s Get Started',
                  style: TextStyle(color: Colors.white),  // Text color inside the button
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50), // Set a custom size for the button
                  backgroundColor: Colors.blueAccent, // Button background color
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal, // Lighter text for the button
                    fontSize: 18, // Larger text size for better visibility
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the button
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
