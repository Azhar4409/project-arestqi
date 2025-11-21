import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Sneaker Olahraga',
      'price': 899000,
      'image': 'https://i.ibb.co/1nJ1Vs9/sneaker.jpg',
    },
    {
      'name': 'Headphone Nirkabel Noise',
      'price': 1500000,
      'image': 'https://i.ibb.co/1nJ1Vs9/headphone.jpg',
    },
    {
      'name': 'Smartwatch Tahan Air',
      'price': 1250000,
      'image': 'https://i.ibb.co/1nJ1Vs9/smartwatch.jpg',
    },
    {
      'name': 'Kamera Mirrorless Pro',
      'price': 12000000,
      'image': 'https://i.ibb.co/1nJ1Vs9/kamera.jpg',
    },
    {
      'name': 'Jaket Bomber Stylish Pria',
      'price': 549000,
      'image': 'https://i.ibb.co/1nJ1Vs9/jaket.jpg',
    },
    {
      'name': 'Meja Kerja Minimalis',
      'price': 2100000,
      'image': 'https://i.ibb.co/1nJ1Vs9/meja.jpg',
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Home', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/300'), // contoh avatar
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Penawaran Spesial Musim Panas!\nDiskon hingga 50% untuk produk pilihan.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://i.ibb.co/2WcMZMW/summer-sale.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          Text('Produk Terbaru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          GridView.builder(
            itemCount: products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        productName: product['name'],
                        productPrice: product['price'],
                        productImage: product['image'],
                      ),
                    ),
                  );
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text(product['name'],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(formatRupiah(product['price']),
                            style: TextStyle(color: Colors.grey[700])),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}