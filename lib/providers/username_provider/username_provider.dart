import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/adjectives.dart';
import 'data/nouns.dart';

class UsernameProvider with ChangeNotifier {
  String? _username;
  SharedPreferences? _preferences;

  String? get username => _username;
  String get initials => getInitials(_username);

  UsernameProvider() {
    _loadFromSharedPreferences();
  }

  // Gets the instance of the shared preferences
  _initPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  /// Loads ther username value from the shared preferences into the provider or creates a new username and does the same
  _loadFromSharedPreferences() async {
    await _initPreferences();

    String? loadedUsername = _preferences!.getString('username');

    if (loadedUsername != null) {
      _username = loadedUsername;
    } else {
      // Generate username
      _username = _createUsername();

      // Set username
      _persistUsername(_username!);
    }

    notifyListeners();
  }

  /// Writes the given username to the shared preferences
  _persistUsername(String username) async {
    await _initPreferences();

    _preferences!.setString('username', username);
  }

  /// Returns a random username based on adjectives and nouns list like '@<adjective>_<noun>'
  String _createUsername() {
    List<String> adjectivesList = adjectives;
    List<String> nounsList = nouns;

    final randomAdjective = _getRandomElement(adjectivesList);
    final randomNoun = _getRandomElement(nounsList);

    return '@${randomAdjective}_$randomNoun';
  }

  String _getRandomElement<String>(List<String> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  String getInitials(String? username) {
    if (username == null) {
      return '';
    } else {
      try {
        String firstLetter = username.split('@')[1].substring(0, 1);
        String secondLetter = username.split('_')[1].substring(0, 1);
        return '$firstLetter$secondLetter'.toUpperCase();
      } catch (e) {
        return '';
      }
    }
  }
}
