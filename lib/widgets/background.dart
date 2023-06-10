import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget card;

  const Background({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _UpBackground(),
          _UserIcon(),
          this.card
        ],
      )
    );
  }
}

class _UserIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 40),
          child: const Icon(Icons.person_pin, color: Colors.white, size: 200)
      ),
    );
  }
}

class _UpBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.45,
      decoration: _pinkBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30,),
          Positioned(child: _Bubble(), top: -40, left: -30,),
          Positioned(child: _Bubble(), bottom: -50, right: -20,),
          Positioned(child: _Bubble(), bottom: -50, left: 10,),
          Positioned(child: _Bubble(), bottom: 90, left: 180,),
          Positioned(child: _Bubble(), top: 40, right: 130,),
          Positioned(child: _Bubble(), bottom: 120, right: 20,),
        ],
      ),
    );
  }

  BoxDecoration _pinkBackground() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFF9E007E),
        Color(0xFFFF80AB)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(0x40FF80AB)
      ),
    );
  }
}

