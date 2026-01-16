import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

  int count = 0;

  void incremant(){
    count++;
    notifyListeners(); // UI কে জানানো হচ্ছে change হয়েছে
  }

  void decrement(){
    count--;
    notifyListeners();
  }

}