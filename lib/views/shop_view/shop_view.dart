import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/models/products_model/product.dart';
import 'package:huskies_app/provider/product_provider/product_provider.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/shop_widgets/item_details.dart';
import 'package:huskies_app/constants/helpers.dart';

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
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.basketShopping,
            color: AppTheme.black,
          ),
        ),
        title: const Text('Shop', style: AppTheme.titleBlack),
        actions: const [
          Padding(
            padding: AppTheme.defaultHorizontalDistance,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/da.jpg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: AppTheme.paddingL,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
          ),
          itemCount: productsList.length,
          itemBuilder: (BuildContext context, int i) {
            return InkWell(
              onTap: () {
                if (products != null) Helpers.launchToWebsite(products[i]);

                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ItemsDetails(item: productsList[i]),
                //   ),
                // );
              },
              child: Column(
                children: [
                  Image.asset(productsList[i]['image']!),
                  Padding(
                    padding: AppTheme.paddingM,
                    child: Column(
                      crossAxisAlignment: AppTheme.crossAlignStart,
                      children: [
                        Text(productsList[i]['title']!, style: AppTheme.textDefaultSmall10Black),
                        const SizedBox(height: 6),
                        Text(productsList[i]['price']!, style: AppTheme.textDefaultSmallW500Red),
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
}