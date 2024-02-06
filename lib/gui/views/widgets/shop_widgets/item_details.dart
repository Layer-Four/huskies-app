import 'package:flutter/material.dart';
import 'package:huskies_app/logic/helper/app_theme.dart';

class ItemsDetails extends StatelessWidget {
  final Map item;
  const ItemsDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: AppTheme.mainBetween,
          children: [
            const SizedBox(),
            const Row(
              children: [
                Icon(
                  Icons.shop_outlined,
                  color: AppTheme.black,
                ),
                Text(
                  " Shop",
                  style: TextStyle(color: AppTheme.orange),
                ),
              ],
            ),
            Container(
              margin: AppTheme.paddingM,
              width: 45,
              decoration:const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/da.jpg',
                width: 35,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(item['image'], scale: 0.6),
          Text(
            item['title'],
            textAlign: AppTheme.textCenter,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            item['price'],
            textAlign: AppTheme.textCenter,
            style: const TextStyle(color: AppTheme.red, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: AppTheme.mainCenter,
            children: [
              const Text('Color :'),
              AppTheme.widthOnlySizedBox,
              Container(
                height: 20,
                width: 20,
                decoration: AppTheme.itemColorSelection,
              ),
              AppTheme.widthOnlySizedBox,
              Container(
                height: 20,
                width: 20,
                decoration: AppTheme.itemColorSelection2,
              ),
            ],
          ),
          Container(
            margin: AppTheme.hugePaddingTop,
            child: const Text(
              'Size: 34 35 40 41',
              textAlign: AppTheme.textCenter,
            ),
          ),
          Container(
            margin: AppTheme.paddingL,
            child: MaterialButton(
              padding: AppTheme.defaultVerticalDistance,
              onPressed: () {},
              color: AppTheme.black,
              textColor: AppTheme.white,
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
