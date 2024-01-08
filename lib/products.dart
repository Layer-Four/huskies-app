import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huskies_app/details.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  final List<Map<String, String>> products = [
    {
      "image": "assets/second.png",
      "title": "EC Kassel Huskies Fan Jersey\nSaison 2023 /2024",
      "price": "89.00€",
    },
    {
      "image": "assets/first.png",
      "title": "EC Kassel Huskies HALLOWEEN Fan\nJersey Saison 2023 /2024",
      "price": "89.00€",
    },
    {
      "image": "assets/four.png",
      "title": "Retired Game Fan Shirt",
      "price": "20.00€",
    },
    {
      "image": "assets/third.png",
      "title": "Retired Game Hoodie Women",
      "price": "35.00€",
    },
    {
      "image": "assets/last.png",
      "title": "Huskies Fan Fahne\n150 x 200 cm Hochformat",
      "price": "59.00€",
    },
    {
      "image": "assets/gutschrift.png",
      "title": "Gutschein 20 Euro",
      "price": "20.00€",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.basketShopping,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Shop',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/da.jpg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 270,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext ctx, int i) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ItemsDetails(data: products[i]),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      products[i]['image']!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[i]['title']!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          products[i]['price']!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
