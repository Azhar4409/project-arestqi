import 'package:flutter/material.dart';
import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> favorites = [
    {
      'name': 'Sepatu Lari UltraBoost 22',
      'price': 1800000,
      'image': 'https://i.ibb.co/1nJ1Vs9/sneaker.jpg',
    },
    {
      'name': 'Headphone Nirkabel WH-1000XM5',
      'price': 4500000,
      'image': 'https://i.ibb.co/1nJ1Vs9/headphone.jpg',
    },
    {
      'name': 'Smartwatch Galaxy Watch 5',
      'price': 3200000,
      'image': 'https://i.ibb.co/1nJ1Vs9/smartwatch.jpg',
    },
    {
      'name': 'Tas Ransel Laptop Ergonomis',
      'price': 750000,
      'image': 'https://i.ibb.co/1nJ1Vs9/bag.jpg',
    },
    {
      'name': 'Kamera Mirrorless EOS R50',
      'price': 12000000,
      'image': 'https://i.ibb.co/1nJ1Vs9/kamera.jpg',
    },
    {
      'name': 'Speaker Bluetooth Portabel',
      'price': 900000,
      'image': 'https://i.ibb.co/1nJ1Vs9/speaker.jpg',
    },
  ];

  String formatRupiah(int price) {
    return 'Rp ' +
        price.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      appBar: AppBar(
        title: Text('Favorit', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: favorites.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 3 / 4),
          itemBuilder: (context, index) {
            final product = favorites[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailPage(
                              productName: product['name'],
                              productPrice: product['price'],
                              productImage: product['image'],
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        product['image'],
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(product['name'],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(formatRupiah(product['price']),
                          style: TextStyle(color: Colors.grey[700])),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          // logic unfavorite
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}