import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart'; // Import your existing settings model

class SettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use ChangeNotifierProvider to manage state
    return ChangeNotifierProvider(
      create: (_) => SettingsModel()..loadPreferences(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Consumer<SettingsModel>(
          builder: (context, settingsModel, child) {
            return ListView(
              children: [
                SwitchListTile(
                  title: Text('Setting 1'),
                  value: settingsModel.switchValue1,
                  onChanged: (value) {
                    settingsModel.toggleSwitch1(value);
                  },
                ),
                SwitchListTile(
                  title: Text('Setting 2'),
                  value: settingsModel.switchValue2,
                  onChanged: (value) {
                    settingsModel.toggleSwitch2(value);
                  },
                ),
                SwitchListTile(
                  title: Text('Setting 3'),
                  value: settingsModel.switchValue3,
                  onChanged: (value) {
                    settingsModel.toggleSwitch3(value);
                  },
                ),
                SwitchListTile(
                  title: Text('Setting 4'),
                  value: settingsModel.switchValue4,
                  onChanged: (value) {
                    settingsModel.toggleSwitch4(value);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
