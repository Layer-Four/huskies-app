import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/user_icon_widget.dart';

class ItemsDetails extends StatelessWidget {
  final Map item;
  const ItemsDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: AppTheme.mainAlignBetween,
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
                  style: TextStyle(),
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(right: 25),
                width: 45,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.antiAlias,
                child: const UserIconWidget()),
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
            mainAxisAlignment: AppTheme.mainAlignCenter,
            children: [
              const Text('Color :'),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: AppTheme.grey,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.orange),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: AppTheme.black,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
          Container(
            margin: AppTheme.paddingTopMedium,
            child: const Text(
              'Size: 34 35 40 41',
              textAlign: AppTheme.textCenter,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: MaterialButton(
              padding: AppTheme.padding0_16,
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
