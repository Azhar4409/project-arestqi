import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String productName;
  final int productPrice;
  final String productImage;

  const DetailPage({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  String formatRupiah(int price) {
    return 'Rp ' +
        price.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.');
  }

  final String description =
      "Rasakan energi tak terbatas dengan Sepatu Lari UltraBoost 22. "
      "Didesain ulang dengan sol BOOST yang lebih responsif dan bagian atas Primknit+ yang adaptif, "
      "sepatu ini memberikan kenyamanan dan pengembalian energi maksimal di setiap langkah. "
      "Ideal untuk pelari harian dan mereka yang mencari performa tinggi dengan gaya. "
      "Bagian atasnya terbuat dari 50% Parley Ocean Plastic dan 50% poliester daur ulang, "
      "menunjukkan komitmen kami terhadap keberlanjutan. Desain ramping dan warna-warna modern "
      "membuatnya cocok untuk dipakai sehari-hari juga.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.productName, style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.productImage,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(widget.productName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(formatRupiah(widget.productPrice),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(description,
                style: TextStyle(color: Colors.grey[800], fontSize: 14)),
            SizedBox(height: 24),
            Row(
              children: [
                Text('Jumlah:',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: quantity > 1
                              ? () {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              : null,
                          icon: Icon(Icons.remove)),
                      Text(quantity.toString(),
                          style: TextStyle(fontSize: 16)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          '$quantity x ${widget.productName} berhasil ditambahkan ke keranjang')));
                },
                child: Text('Tambah ke Keranjang', style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}