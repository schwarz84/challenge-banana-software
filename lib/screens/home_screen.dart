import 'package:flutter/material.dart';
import 'package:flutter_challenge_2023/screens/screens.dart';
import 'package:flutter_challenge_2023/services/services.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsServices = Provider.of<ProductsServices>(context);

    if (productsServices.isLoading) return LoadingScreen();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Challenge 2023',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ProductsSearch(),
                ).then((product) {
                  if (product != null) {
                    Navigator.pushNamed(context, 'home');
                  }
                });
              },
            )
          ],
      ),
        body: ListView.builder(
          itemCount: productsServices.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            child: ProductCard(
              product: productsServices.products[index],),
            onTap: () async {
              await productsServices.getProductById(productsServices.products[index].id);
              Navigator.pushNamed(context, 'product');
          },
          ),
        ),
    );
  }
}
