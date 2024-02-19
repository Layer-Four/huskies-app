import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/models/products_model/product.dart';

class ProductNotifier extends AsyncNotifier<List<Product>> {
  final productsDB = FirebaseFirestore.instance.collection('products').get();
  Future<List<Product>> _build() async {
    final dbList = await productsDB;
    List<Product> products = [];
    for (var element in dbList.docs) {
      log('querry element from DB-> ${element.data()}');
      products.add(Product.fromJson(element.data()));
    }
    return products;
  }

  @override
  FutureOr<List<Product>> build() async {
    return _build();
  }
}
