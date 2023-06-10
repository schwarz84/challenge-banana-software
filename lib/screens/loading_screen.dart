import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Challenge 2023',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: Color(0xFF9E007E),
        ),
      )
    );
  }
}
