import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: SidePanel(), // Drawer used as side menu
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('john.doe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Add your settings page navigation here
              Navigator.pop(context);
            },
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