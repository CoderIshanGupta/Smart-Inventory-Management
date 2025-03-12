import 'package:flutter/material.dart';
import 'package:inventory/Registration.dart';
import 'package:inventory/dashboard.dart';
import 'package:inventory/signup.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LalaJi Ledgers'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding for spacing
          child: Image.asset(
            'assets/images/Rupee.jpg', // Correct image path
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SingleChildScrollView(  // Ensures content scrolls in case of overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content
            children: [
              // Add the image at the top, centered
              Center(
                child: Image.asset(
                  'assets/images/Lalaji.webp',  // Correct path to the image
                  height: 150,  // Adjust height as needed
                  fit: BoxFit.contain, // Ensures image is contained within the given size
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Welcome to LalaJi Ledgers Setup',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, // Centered text
              ),
              SizedBox(height: 16),
              Text(
                'Start your Business Journey with ease.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,  // Centered text
              ),
              SizedBox(height: 24),
              Text(
                'Choose a method to proceed with login.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,  // Centered text
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for phone registration
                },
                child: Text('Continue with Phone'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),  // Full-width and 50px height
                  backgroundColor: Colors.blue,  // Background color of the button
                  foregroundColor: Colors.white, // Text color inside the button
                  textStyle: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w400, // Reduced boldness
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () { // Navigate to SignIn portion of SignUpSignInPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpSignInPage(isSignUp: false),
                    ),
                  );
                },
                child: Text('Continue with Email'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),  // Full-width and 50px height
                  backgroundColor: Colors.blue,  // Background color of the button
                  foregroundColor: Colors.white, // Text color inside the button
                  textStyle: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w400, // Reduced boldness
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'New to LalaJi Ledgers? Let’s get you onboard :)',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,  // Centered text
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Dashboard after clicking on Let's Get Started
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BusinessRegistrationPage()),
                  );
                },
                child: Text('Let’s Get Started'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),  // Full-width and 50px height
                  backgroundColor: Colors.blue,  // Background color of the button
                  foregroundColor: Colors.white, // Text color inside the button
                  textStyle: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w400, // Reduced boldness
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
