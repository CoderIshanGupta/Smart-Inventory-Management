import 'package:flutter/material.dart';
import 'package:inventory/settings_widget.dart';
import 'Onboarding.dart'; // Import the OnboardingPage
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          // Logout button in AppBar
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // When the user clicks logout, navigate to the RegistrationPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RegistrationPage()),
              );
            },
          ),
        ],
      ),
      drawer: SidePanel(),
      body: Center(
        child: Text('Dashboard Content Goes Here', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: QRButton(), // QR code scanner button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// The Profile Page (This can be a simple placeholder for now)
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("User Profile Information", style: TextStyle(fontSize: 24))),
    );
  }
}

// Side Panel (Hamburger Menu)
class SidePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('john.doe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
          ),
          // Profile item above Dashboard
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()), // Navigate to ProfilePage
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Spacer to push the Settings item to the bottom
          Spacer(),
          Divider(),  // Divider to separate common items from Settings
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to the SettingsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsWidget()), // Navigate to SettingsPage
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// QR Button for scanning QR code
class QRButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', // Color of the scanner line
          'Cancel', // Text for cancel button
          true, // Whether to show a flash icon
          ScanMode.QR, // Scan mode: QR or Barcode
        );
        if (barcodeScanRes != '-1') {
          // Handle the result of QR scan
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Scanned QR Code'),
              content: Text(barcodeScanRes),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      child: Icon(Icons.qr_code),
      backgroundColor: Colors.blue,
    );
  }
}
