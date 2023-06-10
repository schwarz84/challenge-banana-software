import 'package:flutter/material.dart';
import 'package:flutter_challenge_2023/models/models.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        height: 300,
        decoration: _cardDecoration(),
        child: Column(
          children: [
            _HeaderCard( product.title, product.price),
            Spacer(),
            _BodyCard(product.description),
            Spacer(),
            _FooterCard(product.stock),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(50),
    boxShadow: [
      BoxShadow(
        color: Colors.black54,
        blurRadius: 20,
        offset: Offset(0,20)
      )
    ]
  );
}

class _HeaderCard extends StatelessWidget {

  final String title;
  final int price;

  const _HeaderCard(this.title, this.price);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            children: [
              Text( this.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              Spacer(),
              Text('USD${this.price}' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {

  final String description;

  const _BodyCard(this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        child: Column(
          children: [
            Text(this.description)
          ],
        ),
      ),
    );
  }
}

class _FooterCard extends StatelessWidget {

  final int stock;

  const _FooterCard(this.stock);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text('Stock: ${this.stock}'),
            ],
          ),
        ),
      ),
    );
  }
}
