import 'package:flutter/material.dart';
import 'package:inventory/signup.dart';

class BusinessRegistrationPage extends StatefulWidget {
  @override
  _BusinessRegistrationPageState createState() =>
      _BusinessRegistrationPageState();
}

class _BusinessRegistrationPageState extends State<BusinessRegistrationPage> {
  final _shopNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _gstinController = TextEditingController();

  // Dropdown value for Business Category
  String? _selectedCategory;
  final List<String> _businessCategories = [
    'Retail',
    'Wholesale',
    'Manufacturing',
    'Service',
    'E-commerce',
    'Other',
  ];

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
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centers the content
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Business Registration',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),

                // Shop Name Field
                TextField(
                  controller: _shopNameController,
                  decoration: InputDecoration(
                    labelText: 'Shop Name',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.store, color: Colors.black),
                  ),
                ),
                SizedBox(height: 16),

                // Location Field
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.location_on, color: Colors.black),
                  ),
                ),
                SizedBox(height: 16),

                // GSTIN Field
                TextField(
                  controller: _gstinController,
                  decoration: InputDecoration(
                    labelText: 'GSTIN (Optional)',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.business, color: Colors.black),
                  ),
                ),
                SizedBox(height: 16),

                // Business Category Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Business Category',
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  items: _businessCategories
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                      .toList(),
                ),
                SizedBox(height: 24),

                // Submit Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the business registration logic
                      // Show a snackbar or proceed with the data
                      if (_shopNameController.text.isNotEmpty &&
                          _locationController.text.isNotEmpty &&
                          (_selectedCategory != null)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpSignInPage(isSignUp: true), // Pass isSignUp as true for SignUp
                          ),
                        );
                        // Business registration logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Business Registered Successfully!')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill all fields')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}