import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_provider.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/loading_view.dart';
import 'package:huskies_app/views/loading_view.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_provider.dart'; // Import the productProvider
import 'package:huskies_app/provider/product_provider/product_notifier.dart'; // Import ProductNotifier

class ShopView extends ConsumerWidget {
  const ShopView({Key? key}) : super(key: key);

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
        appBar: AppBar(
          backgroundColor: AppTheme.white,
          centerTitle: true,
          title: const HeadWidget(
            start: Icon(
              Icons.shopping_basket_outlined,
            ),
            center: Text('Shop', style: AppTheme.titleBlack),
            end: UserIconWidget(),
          ),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppTheme.xtraSmall - 4,
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
                        crossAxisAlignment: AppTheme.crossAlignStart,
                        children: [
                          Text(
                            products[i].title,
                            maxLines: 2,
                            style: AppTheme.textMedium,
                          ),
                          Text('${products[i].price.toStringAsFixed(2)}€',
                              style: AppTheme.textDefaultRed),
                        ],
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
    return const LoadingView();
  }
}
