import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // State field(s) for Switch widget.
  bool? switchValue1 = false;
  bool? switchValue2 = false;
  bool? switchValue3 = false;
  bool? switchValue4 = false;

  @override
  void initState() {
    super.initState();
    // Initialize any state variables here, if needed
  }

  @override
  void dispose() {
    // Dispose of any controllers or listeners if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Switch 1'),
            value: switchValue1 ?? false,
            onChanged: (value) {
              setState(() {
                switchValue1 = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Switch 2'),
            value: switchValue2 ?? false,
            onChanged: (value) {
              setState(() {
                switchValue2 = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Switch 3'),
            value: switchValue3 ?? false,
            onChanged: (value) {
              setState(() {
                switchValue3 = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Switch 4'),
            value: switchValue4 ?? false,
            onChanged: (value) {
              setState(() {
                switchValue4 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
  ));
}