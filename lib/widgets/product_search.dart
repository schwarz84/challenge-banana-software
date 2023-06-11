import 'package:flutter/material.dart';
import 'package:flutter_challenge_2023/services/services.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class ProductsSearch extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    final productsServices = Provider.of<ProductsServices>(context, listen: false);
    return FutureBuilder(
      future: productsServices.searchProducts(query),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;

          if (products.isEmpty) {
            return Center(
              child: Text('No se encontraron resultados para $query',
                style: TextStyle(fontSize: 18)),
            );
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Icon(Icons.search),
              title: Text(products[index].title),
              onTap: () async {
                await productsServices.getProductById(products[index].id);
                Navigator.pushNamed(context, 'product');
              }
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        );

      },
    );
  }
}
