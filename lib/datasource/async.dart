import 'package:flutter/material.dart';

abstract class AsyncData extends ChangeNotifier{
  bool disposed =false;
  bool isLoading = false;

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if(!disposed){super.notifyListeners();}
  }

  @mustCallSuper
  void resetData(){
    isLoading = false;
  }
}