import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String messege) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(messege, style: TextStyle(color: Colors.white, fontSize: 20))
    );
    
    messengerKey.currentState?.showSnackBar(snackBar);
  }
}