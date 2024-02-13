import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';

import 'package:huskies_app/views/view_widgets/shop_widgets/item_details.dart';

class ShopView extends ConsumerWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ItemsDetails(item: productsList[i]),
                  ),
                );
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
