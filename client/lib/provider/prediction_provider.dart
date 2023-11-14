import 'package:flutter/material.dart';

class PredictionProvider with ChangeNotifier {
  String _city = '';
  int _area = 0;
  int _bedrooms = 0;
  bool _maintenance = false;
  bool _security = false;
  double _predictionResult = 0;

  String get city => _city;
  int get area => _area;
  int get bedrooms => _bedrooms;
  bool get maintenance => _maintenance;
  bool get security => _security;
  double get predictionResult => _predictionResult;

  set predictionResult(double value) {
    _predictionResult = value;
    notifyListeners();
  }

  set city(String value) {
    _city = value;
    notifyListeners();
  }

  set area(int value) {
    _area = value;
    notifyListeners();
  }

  set bedrooms(int value) {
    _bedrooms = value;
    notifyListeners();
  }

  set maintenance(bool value) {
    _maintenance = value;
    notifyListeners();
  }

  set security(bool value) {
    _security = value;
    notifyListeners();
  }
}
