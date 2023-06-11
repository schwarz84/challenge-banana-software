import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier {
  final String _baseUrl = 'dummyjson.com';
  final List<Product> products = [];
  bool isLoading = true;
  Product? selectedProduct;

  ProductsServices() {
    this.loadProducts();
  }

  get query => null;

  Future loadProducts() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.http(_baseUrl, 'products');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);
    final List productsJson = productsMap['products'];

    this.products.addAll(productsJson.map((value) => Product.fromJson(value)));

    this.isLoading = false;
    notifyListeners();

    return this.products;
  }

  Future<Product?> getProductById(int id) async {
    final url = Uri.https(_baseUrl, 'products/$id');
    final resp = await http.get(url);

    final Map<String, dynamic> productMap = json.decode(resp.body);
    selectedProduct = Product.fromJson(productMap);
    notifyListeners();
    return null;
  }

  Future<List<Product>> searchProducts(String query) async {
    final url = Uri.https(_baseUrl, '/products/search', {'q': query});
    final resp = await http.get(url);

      final Map<String, dynamic> productsMap = json.decode(resp.body);
      final List productsJson = productsMap['products'];

      List<Product> searchResults = productsJson.map((value) => Product.fromJson(value)).toList();

      return searchResults;
  }
}