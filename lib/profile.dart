import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Action on button press
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Correct way to set the color
          ),
          child: Text("Logout"),
        ),
      ),
    );
  }
}