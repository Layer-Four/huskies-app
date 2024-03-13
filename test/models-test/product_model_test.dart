import 'package:flutter_test/flutter_test.dart';
import 'package:huskies_app/models/products_model/product.dart';

void main() {
  group('Product', () {
    const product = Product(
      imageUrl: 'https://example.com/image.jpg',
      price: 19.99,
      shopUrl: 'https://example.com/shop',
      title: 'Test Product',
    );

    test('create Product', () {
      expect(product.imageUrl, 'https://example.com/image.jpg');
      expect(product.price, 19.99);
      expect(product.shopUrl, 'https://example.com/shop');
      expect(product.title, 'Test Product');
    });

    test('Product -> toJson() -> fromJson(-> Product)', () {
      final Map<String, dynamic> productJson = product.toJson();
      final decodedProduct = Product.fromJson(productJson);
      expect(decodedProduct, product);
    });
  });
}
