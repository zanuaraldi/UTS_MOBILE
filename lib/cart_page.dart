import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh daftar produk di keranjang (ini bisa Anda ganti dengan data dinamis)
    final List<Map<String, dynamic>> cartItems = [
      {
        'name': 'Product 1',
        'price': 100.0,
        'image': 'assets/images/home8.jpg', // Ganti dengan path gambar produk yang sesuai
      },
      {
        'name': 'Product 2',
        'price': 150.0,
        'image': 'assets/images/home8.jpg', // Ganti dengan path gambar produk yang sesuai
      },
      {
        'name': 'Product 3',
        'price': 200.0,
        'image': 'assets/images/home8.jpg', // Ganti dengan path gambar produk yang sesuai
      },
    ];

    return Scaffold(
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      item['image'],
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item['name']),
                    subtitle: Text('\$${item['price']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        // Aksi untuk menghapus produk dari keranjang (tambahkan logika Anda di sini)
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${cartItems.fold(0.0, (total, item) => total + item['price']).toInt()}', // Convert to int
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk melanjutkan ke proses checkout
                },
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
