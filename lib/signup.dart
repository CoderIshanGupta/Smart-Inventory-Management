import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SignUpSignInPage(isSignUp: false))); // Default to SignIn page
}

class SignUpSignInPage extends StatefulWidget {
  final bool isSignUp; // Track whether to show SignUp or SignIn

  // Constructor to pass the mode (SignUp or SignIn)
  SignUpSignInPage({required this.isSignUp});

  @override
  _SignUpSignInPageState createState() => _SignUpSignInPageState();
}

class _SignUpSignInPageState extends State<SignUpSignInPage> {
  late bool _isSignUp; // Use a local variable to track the mode

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Track the visibility of the passwords
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isSignUp = widget.isSignUp; // Initialize the mode with the passed value
  }

  void _validateFields() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      // Check for empty fields and show the validation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_isSignUp && _confirmPasswordController.text.isEmpty) {
      // If it's a sign-up form, make sure confirm password is filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all the fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_isSignUp &&
        _passwordController.text != _confirmPasswordController.text) {
      // If it's sign-up, ensure passwords match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Proceed with either Sign In or Sign Up based on the mode
    if (_isSignUp) {
      // Implement sign-up logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign Up Successful')),
      );
    } else {
      // Implement sign-in logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign In Successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Disable default back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
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
                  _isSignUp ? 'Create Account' : 'Sign In',
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
                      obscureText: !_isPasswordVisible,  // Toggle password visibility
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
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;  // Toggle visibility
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Reduced gap
                    // Only show confirm password in SignUp mode
                    if (_isSignUp)
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,  // Toggle visibility
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
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;  // Toggle visibility
                              });
                            },
                          ),
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
                  onPressed: _validateFields, // Call validation function on submit
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
                    _isSignUp ? 'Sign Up' : 'Sign In',
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
                    _isSignUp = !_isSignUp; // Toggle the mode
                  });
                },
                child: Text(
                  _isSignUp
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
