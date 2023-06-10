import 'package:flutter/material.dart';
import 'package:flutter_challenge_2023/services/products_services.dart';
import 'package:flutter_challenge_2023/widgets/widgets.dart';
import 'package:flutter_challenge_2023/models/models.dart';
import 'package:provider/provider.dart';


class ProductScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsServices>(context);

    return  Scaffold(
        appBar: AppBar(
          title: Text(
            productService.selectedProduct!.title,
            style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ImagesGaleria(urls: productService.selectedProduct?.images),
                  _DescriptionProduct(productService.selectedProduct!.description, productService.selectedProduct!.price),
                ],
              ),
            ),
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            disabledColor: Colors.grey,
            color: Color(0xFF9E007E),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Text('Agregar al carrito', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),)
            ),
            onPressed: () {
            }
          ),
          SizedBox(height: 20)

        ],
      ),
    );
  }
}

class _DescriptionProduct extends StatelessWidget {

  final String description;
  final int price;

  const _DescriptionProduct( this.description, this.price);

  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                  this.description,
                style: TextStyle(fontSize: 20),
              )
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'USD${this.price}',
                style: TextStyle(fontSize: 30),
              )
            ),
          ],
        ),
    );
  }
}


