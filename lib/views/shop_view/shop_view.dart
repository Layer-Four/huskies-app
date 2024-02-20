import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/loading_view.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_provider.dart'; // Import the productProvider
import 'package:huskies_app/provider/product_provider/product_notifier.dart'; // Import ProductNotifier

class ShopView extends ConsumerWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productProvider);

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
      body: _buildBody(ref, productsAsync),
    );
  }

  Widget _buildBody(WidgetRef ref, AsyncValue<List<Product>> productsAsync) {
    return productsAsync.when(
      data: (products) {
        return _buildShopView(products);
      },
      loading: () {
        return LoadingView();
      },
      error: (error, stackTrace) {
        return Center(child: Text('Error: $error'));
      },
    );
  }

  Widget _buildShopView(List<Product> products) {
    return Padding(
      padding: AppTheme.paddingL,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int i) {
          return InkWell(
            onTap: () {
              Helpers.launchToWebsite(products[i].shopUrl);
            },
            child: Column(
              children: [
                Image.network(products[i].imageUrl, height: 80, width: 80),
                Padding(
                  padding: AppTheme.paddingM,
                  child: Column(
                    crossAxisAlignment: AppTheme.crossAlignStart,
                    children: [
                      Text(products[i].title, style: AppTheme.smallText),
                      const SizedBox(height: 6),
                      Text('${products[i].price}€', style: AppTheme.defaultTextSmallRed),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
