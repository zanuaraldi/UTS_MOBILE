import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Kami adalah platform e-commerce yang menyediakan berbagai produk berkualitas dengan harga terjangkau. '
            'Misi kami adalah memberikan pengalaman berbelanja yang menyenangkan dan mudah bagi semua pelanggan. '
            'Kami berkomitmen untuk memberikan layanan terbaik dan memenuhi kebutuhan belanja Anda.',
            textAlign: TextAlign.center, // Center the text for better presentation
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
