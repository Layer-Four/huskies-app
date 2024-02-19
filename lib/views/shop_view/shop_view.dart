import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopView extends ConsumerWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product>? products = ref.watch(productProvider).when(
      data: (data) {
        final list = <Product>[];
        for (var element in data) {
          list.add(element);
        }
        return list;
      },
      loading: () {
        ref.read(statusProvider.notifier).onLoading();
        return;
        // ref.watch(productProvider as ProviderListenable<List<Product>>);
      },
      error: (error, stackTrace) {
        throw Exception('error ->$error ,this was the callstack\n$stackTrace');
      },
    );
    if (products != null) {
      return Scaffold(
        backgroundColor: AppTheme.white,
        appBar: AppBar(
          centerTitle: true,
          title: const HeadWidget(
            start: Icon(Icons.shopping_basket_outlined),
            center: Text('Shop', style: AppTheme.titleBlack),
            end: UserIconWidget(),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              onTap: () {
                Helpers.launchToWebsite(products[i].shopUrl, mode: LaunchMode.inAppBrowserView);
              },
              child: Card(
                child: Container(
                  height: 120,
                  decoration: AppTheme.whiteBox,
                  child: Column(
                    children: [
                      Image.network(products[i].imageUrl, height: 95, width: 95),
                      Padding(
                        padding: AppTheme.paddingM,
                        child: Column(
                          mainAxisAlignment: AppTheme.mainAlignEvenly,
                          crossAxisAlignment: AppTheme.crossAlignStart,
                          children: [
                            Padding(
                              padding: AppTheme.paddingM,
                              child: Text(
                                products[i].title,
                                maxLines: 2,
                                style: AppTheme.textMedium,
                              ),
                            ),
                            Text('${products[i].price.toStringAsFixed(2)}€',
                                style: AppTheme.textDefaultRed),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // ],
        // ),
      );
    }
    return const SizedBox(
      child: Center(child: Text('No Data found')),
    );
  }
}
