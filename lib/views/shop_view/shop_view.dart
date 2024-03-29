import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_provider.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/loading_view/loading_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopView extends ConsumerWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product>? products = ref.watch(productProvider).when(
          data: (data) => data,
          loading: () => null,
          error: (error, stackTrace) {
            throw Exception('error ->$error ,this was the callstack\n$stackTrace');
          },
        );
    if (products != null) {
      return Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 182,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              onTap: () {
                Helpers.launchToWebsite(products[i].shopUrl, mode: LaunchMode.inAppBrowserView);
              },
              child: Card(
                elevation: 4,
                child: Container(
                  alignment: Alignment.center,
                  padding: AppTheme.paddingS,
                  decoration: AppTheme.whiteBox,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(products[i].imageUrl, height: 100, width: 100),
                      Column(
                        mainAxisAlignment: AppTheme.mainAlignEvenly,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              products[i].title,
                              maxLines: 2,
                              style: AppTheme.textMedium,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text('${products[i].price.toStringAsFixed(2)}€',
                                style: AppTheme.textDefaultRed),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
    return _buildLoadingScreen(products);
  }

  Widget _buildLoadingScreen(List<Product>? products) {
    if (products == null) {
      return const LoadingView();
    }
    return const SizedBox();
  }
}
