import 'package:flutter/material.dart';
import 'package:first_trip_around_the_sun/utils/constants.dart';

class SingleNotifier extends ChangeNotifier {
  String _currentDifficulty = levelDifficulty[0];
  SingleNotifier();
  String get currentDifficulty => _currentDifficulty;
  updateDifficulty(String value) {
    if (value != _currentDifficulty) {
      _currentDifficulty = value;
      notifyListeners();
    }
  }
}