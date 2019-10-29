import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Sp {
  Completer<SharedPreferences> _completer = Completer();

  init() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _completer.complete(_preferences);
  }

  Future<int> getInt(String key, {int defaultValue}) async {
    SharedPreferences sharedPreferences = await _completer.future;
    return sharedPreferences.getInt(key) ?? defaultValue;
  }

  Future<void> setInt(String key, int value) async {
    SharedPreferences sharedPreferences = await _completer.future;
    sharedPreferences.setInt(key, value);
  }

  Future<String> getString(String key, {String defaultValue}) async {
    SharedPreferences sharedPreferences = await _completer.future;
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  Future<void> setString(String key, String value) async {
    SharedPreferences sharedPreferences = await _completer.future;
    sharedPreferences.setString(key, value);
  }

  Future<bool> getBool(String key, {bool defaultValue}) async {
    SharedPreferences sharedPreferences = await _completer.future;
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences sharedPreferences = await _completer.future;
    sharedPreferences.setBool(key, value);
  }

  Future<double> getDouble(String key, {double defaultValue}) async {
    SharedPreferences sharedPreferences = await _completer.future;
    return sharedPreferences.getDouble(key) ?? defaultValue;
  }

  Future<void> setDouble(String key, double value) async {
    SharedPreferences sharedPreferences = await _completer.future;
    sharedPreferences.setDouble(key, value);
  }

  Future<List<String>> getStringList(
      String key, List<String> defaultValue) async {
    SharedPreferences sharedPreferences = await _completer.future;
    return sharedPreferences.getStringList(key) ?? defaultValue;
  }

  Future<void> setStringList(String key, List<String> value) async {
    SharedPreferences sharedPreferences = await _completer.future;
    sharedPreferences.setStringList(key, value);
  }
}

class SpKey{
  static const String USER_ACCOUNT = "user_account";
  static const String USER_PROFILE = "user_profile";
}