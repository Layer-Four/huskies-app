import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget {
  final data;
  const ItemsDetails({super.key, this.data});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shop_outlined,
              color: Colors.black,
            ),
            Text(
              "Shop ",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(children: [
        Image.asset(
          widget.data['image'],
          scale: 0.6,
        ),
        Text(
          widget.data['title'],
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          widget.data['price'],
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Color :'),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.grey,
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
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: const Text(
            'Size: 34 35 40 41',
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 15),
            onPressed: () {},
            color: Colors.black,
            textColor: Colors.white,
            child: const Text(
              'Add to Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}
