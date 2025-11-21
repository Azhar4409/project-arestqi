import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  final String aboutText = '''
Selamat datang di Modern Store, tujuan utama Anda untuk pengalaman berbelanja online yang lancar dan menyenangkan. Kami didirikan dengan misi untuk menyediakan produk berkualitas tinggi dengan harga terjangkau, diantar langsung ke pintu Anda.

Kami percaya bahwa berbelanja harus mudah, aman, dan memuaskan. Tim kami berdedikasi untuk memilih koleksi barang-barang yang beragam, mulai dari fashion, elektronik, hingga kebutuhan rumah tangga, semua dirancang untuk memenuhi kebutuhan gaya hidup modern Anda.

Di Modern Store, kepuasan pelanggan adalah prioritas utama kami. Kami berusaha untuk terus meningkatkan layanan kami dan menawarkan pengalaman berbelanja yang tak tertandingi. Terima kasih telah memilih Modern Store sebagai mitra belanja Anda.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      appBar: AppBar(
        title: Text('Tentang Kami', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(Icons.storefront_outlined, size: 64, color: Colors.black87),
            SizedBox(height: 12),
            Text('Modern Store',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Versi 1.0.0',
                style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Text(aboutText,
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    textAlign: TextAlign.justify),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Copyright © 2023-2024 Modern Store\nSemua hak cipta dilindungi.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}