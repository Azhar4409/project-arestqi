import 'package:flutter/material.dart';
import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> popularResults = [
    {
      'name': 'Sepatu Lari UltraBoost 22',
      'price': 1200000,
      'image': 'https://i.ibb.co/1nJ1Vs9/sneaker.jpg',
      'rating': 4.8,
      'review': 250
    },
    {
      'name': 'Tas Selempang Kulit Asli',
      'price': 450000,
      'image': 'https://i.ibb.co/1nJ1Vs9/bag.jpg',
      'rating': 4.5,
      'review': 180
    },
    {
      'name': 'Jam Tangan Pintar Pro X',
      'price': 2500000,
      'image': 'https://i.ibb.co/1nJ1Vs9/watch.jpg',
      'rating': 4.7,
      'review': 320
    },
    {
      'name': 'Headphone Nirkabel Suara Jernih',
      'price': 990000,
      'image': 'https://i.ibb.co/1nJ1Vs9/headphone.jpg',
      'rating': 4.6,
      'review': 210
    }
  ];

  final List<String> recentSearches = [
    'Sepatu Olahraga',
    'Tas Wanita',
    'Kemeja Pria',
    'Jam Tangan'
  ];

  List<Map<String, dynamic>> filteredResults = [];

  @override
  void initState() {
    super.initState();
    filteredResults = popularResults;
  }

  void onSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredResults = popularResults;
      } else {
        filteredResults = popularResults
            .where((p) =>
                p['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  String formatRupiah(int price) {
    return 'Rp ' +
        price.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
  }

  Widget buildTag(String text) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: Colors.black54)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      appBar: AppBar(
        title: Text('Cari', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            TextField(
              controller: searchController,
              onChanged: onSearch,
              decoration: InputDecoration(
                hintText: 'Cari produk, kategori...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 16),
            Text('Pencarian Terbaru',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
            SizedBox(height: 8),
            SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: recentSearches.map((e) => buildTag(e)).toList(),
              ),
            ),
            SizedBox(height: 16),
            Text('Hasil Pencarian Populer',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
            SizedBox(height: 8),
            Expanded(
              child: filteredResults.isEmpty
                  ? Center(child: Text('Produk tidak ditemukan'))
                  : ListView.builder(
                      itemCount: filteredResults.length,
                      itemBuilder: (context, index) {
                        final product = filteredResults[index];
                        return ListTile(
                          leading: Image.network(
                            product['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product['name']),
                          subtitle: Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 14),
                              SizedBox(width: 4),
                              Text('${product['rating']}'),
                              SizedBox(width: 6),
                              Text('(${product['review']} ulasan)')
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(formatRupiah(product['price']),
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                            ],
                          ),
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
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}