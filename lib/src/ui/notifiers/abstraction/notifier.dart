import 'package:flutter/material.dart';

abstract base class Notifier with ChangeNotifier {
  Exception? exception;

  void initState();

  void handleException(Exception exc) {
    exception = exc;
    notifyListeners();
  }

  void resetState() {
    exception = null;
  }
}
