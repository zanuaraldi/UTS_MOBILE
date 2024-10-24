import 'package:flutter/material.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background with gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 1, 169, 253),
              Color.fromARGB(255, 5, 88, 153),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Image
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Text(
                    'Zanu Store',
                    style: TextStyle(
                      fontSize: 40, // Ukuran font besar agar terlihat seperti logo
                      fontWeight: FontWeight.bold, // Membuat teks lebih tebal
                      color: Colors.white, // Warna teks putih agar kontras
                      letterSpacing: 3.0, // Spasi lebih besar untuk kesan modern
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center, // Agar teks berada di tengah secara horizontal
                  ),
                ),
              ),
              // Product Categories Section
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Popular Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              
              // Categories List
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildCategoryCard('Laptops', Icons.laptop, context),
                  _buildCategoryCard('Smartphones', Icons.phone_android, context),
                  _buildCategoryCard('TVs', Icons.tv, context),
                  _buildCategoryCard('Headphones', Icons.headset, context),
                ],
              ),

              // Button to Login
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Go to Login Page',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for category cards using icons
  static Widget _buildCategoryCard(String title, IconData icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Interactivity: Bisa diarahkan ke halaman produk yang sesuai
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$title clicked!'),
        ));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.blueGrey[700],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
