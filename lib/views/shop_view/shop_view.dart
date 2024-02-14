import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/views/view_widgets/headline_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';

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
        body: Padding(
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
                  Helpers.launchToWebsite(products[i]);
                },
                child: Column(
                  children: [
                    Image.network(products[i].imageUrl, height: 80, width: 80),
                    Padding(
                      padding: AppTheme.paddingM,
                      child: Column(
                        crossAxisAlignment: AppTheme.crossAlignStart,
                        children: [
                          Text(products[i].title, style: AppTheme.textDefaultSmall10Black),
                          const SizedBox(height: 6),
                          Text('${products[i].price}€', style: AppTheme.textDefaultSmallW500Red),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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
