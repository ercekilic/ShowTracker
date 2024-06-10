import 'package:flutter/material.dart';


class DbProvider extends ChangeNotifier {
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
  int _counter = 0;
  int x = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
    print("counter= $_counter");
  }

  
}