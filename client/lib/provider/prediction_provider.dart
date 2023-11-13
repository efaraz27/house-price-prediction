import 'package:flutter/material.dart';

class PredictionProvider with ChangeNotifier {
  double _predictionResult = 0;

  double get predictionResult => _predictionResult;

  set predictionResult(double value) {
    _predictionResult = value;
    notifyListeners();
  }
}
