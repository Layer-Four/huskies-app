import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_notifier.dart';

final productProvider = AsyncNotifierProvider<ProductNotifier, List<Product>>(() {
  return ProductNotifier();
});