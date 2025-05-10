import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  String _name = "";
  int _count = 0;

  String get name => _name;
  int get count => _count;

  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count <= 0 ? null : _count--;
    notifyListeners();
  }
}
