//? example list for productsinfo in ShopView
import 'package:flutter/material.dart';
import 'package:huskies_app/constants/app_theme.dart';

const List<Map<String, String>> productsList = [
  {
    "image": "assets/second.png",
    "title": "EC Kassel Huskies Fan Jersey\nSaison 2023 /2024",
    "price": "89.00€",
    "webShopUrl":
        "https://huskies.kamatextil.de/ec-kassel-huskies-fan-jersey-saison-2023-2024,I112470.html",
  },
  {
    "image": "assets/first.png",
    "title": "EC Kassel Huskies HALLOWEEN Fan\nJersey Saison 2023 /2024",
    "price": "89.00€",
    "webShopUrl":
        "https://huskies.kamatextil.de/ec-kassel-huskies-halloween-fan-jersey-saison-2023-2024,I112636.html",
  },
  {
    "image": "assets/four.png",
    "title": "Retired Game Fan Shirt",
    "price": "20.00€",
    "webShopUrl":
        "https://huskies.kamatextil.de/ec-kassel-huskies-authentic-jersey-saison-2023-2024,I112469.html",
  },
  {
    "image": "assets/third.png",
    "title": "Retired Game Hoodie Women",
    "price": "35.00€",
    "webShopUrl":
        "https://huskies.kamatextil.de/ec-kassel-huskies-halloween-authentic-jersey-saison-2023-2024,I112635.html",
  },
  {
    "image": "assets/last.png",
    "title": "Huskies Fan Fahne\n150 x 200 cm Hochformat",
    "price": "59.00€",
    "webShopUrl":
        "https://huskies.kamatextil.de/ec-kassel-huskies-authentic-jersey-saison-2023-2024-nordhessen-arena,I112703.html",
  },
  {
    "image": "assets/gutschrift.png",
    "title": "Gutschein 20 Euro",
    "price": "20.00€",
    "webShopUrl":
        "https://huskies.kamatextil.de/ec-kassel-huskies-fantrikot-saison-2023-2024-nordhessen-arena,I112687.html",
  },
];

Widget fakeHomeView() {
  return Container(
    color: AppTheme.fakeHomeViewColor,
    child: const Center(
      child: Text(
        'Fake-Home-View',
        style: TextStyle(
          fontSize: 35,
          color: AppTheme.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

enum ViewPage {
  forgetpassword,
  login,
  home,
  register,
  shop,
  table,
  ticket,
  newsFeed,
  myTabBar
}
