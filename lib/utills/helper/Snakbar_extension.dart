import 'package:flutter/material.dart';

extension SnakeBar on ScaffoldMessengerState {
  void custmSnakeBar(String message) {
    showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
