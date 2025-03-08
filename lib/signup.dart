import 'package:flutter/material.dart';

class SignUpSignInPage extends StatefulWidget {
  @override
  _SignUpSignInPageState createState() => _SignUpSignInPageState();
}

class _SignUpSignInPageState extends State<SignUpSignInPage> {
  bool isSignUp = true; // Tracks whether the page is in SignUp or SignIn mode

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Disable default back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the RegistrationPage
          },
        ),
        title: Center( // Center the content in the AppBar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Centers the content
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0), // Adjust padding for spacing
                child: Image.asset(
                  'assets/images/Rupee.jpg', // Correct image path
                  fit: BoxFit.cover,
                  height: 40, // Adjust size as needed
                ),
              ),
              SizedBox(width: 10),
              Text(
                'LalaJi Ledgers', // Title of the app
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white, // Body color stays white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align content at the top
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0), // Reduced padding
                child: Text(
                  isSignUp ? 'Create Account' : 'Sign In',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              // Input fields for Email and Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 16), // Reduced gap
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 16), // Reduced gap
                    // Only show confirm password in SignUp mode
                    if (isSignUp)
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),

              // Action Button (Sign Up or Sign In)
              SizedBox(height: 24), // Reduced gap
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle sign up or sign in logic here
                    if (isSignUp) {
                      // Implement sign-up logic (with confirm password validation)
                      if (_passwordController.text == _confirmPasswordController.text) {
                        // Proceed with Sign Up
                      } else {
                        // Show an error message for password mismatch
                      }
                    } else {
                      // Implement sign-in logic
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,  // Button background color
                    foregroundColor: Colors.white, // Text color inside the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    minimumSize: Size(double.infinity, 60),
                  ),
                  child: Text(
                    isSignUp ? 'Sign Up' : 'Sign In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal, // Reduced boldness
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Reduced gap

              // Toggle between Sign In and Sign Up
              TextButton(
                onPressed: () {
                  setState(() {
                    isSignUp = !isSignUp; // Toggle between SignUp and SignIn
                  });
                },
                child: Text(
                  isSignUp
                      ? 'Already have an account? Sign In'
                      : 'Don’t have an account? Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
