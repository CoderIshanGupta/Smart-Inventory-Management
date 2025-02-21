import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For saving preferences

class SettingsModel extends ChangeNotifier {
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  bool switchValue4 = false;

  // Load saved preferences
  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switchValue1 = prefs.getBool('switchValue1') ?? false;
    switchValue2 = prefs.getBool('switchValue2') ?? false;
    switchValue3 = prefs.getBool('switchValue3') ?? false;
    switchValue4 = prefs.getBool('switchValue4') ?? false;
    notifyListeners();
  }

  // Save preferences when a switch is toggled
  Future<void> savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('switchValue1', switchValue1);
    prefs.setBool('switchValue2', switchValue2);
    prefs.setBool('switchValue3', switchValue3);
    prefs.setBool('switchValue4', switchValue4);
  }

  // Toggle the switch state
  void toggleSwitch1(bool value) {
    switchValue1 = value;
    savePreferences();
    notifyListeners();
  }

  void toggleSwitch2(bool value) {
    switchValue2 = value;
    savePreferences();
    notifyListeners();
  }

  void toggleSwitch3(bool value) {
    switchValue3 = value;
    savePreferences();
    notifyListeners();
  }

  void toggleSwitch4(bool value) {
    switchValue4 = value;
    savePreferences();
    notifyListeners();
  }
}