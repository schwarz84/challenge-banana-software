import 'package:flutter/material.dart';

class  FormCard extends StatelessWidget {

  final Widget form;

  const FormCard({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: _cardShape(),
        child: this.form
      ),
    );
  }

  BoxDecoration _cardShape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(35),
    boxShadow: [
      BoxShadow(
        color: Colors.black54,
        blurRadius: 20,
        offset: Offset(0,20)
      )
    ]
  );
}
