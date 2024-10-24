import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/home10.jpg'), // Ganti dengan path gambar profil
                    // Example image; make sure this image exists in your assets folder
                  ),
                  // Edit Icon
                  GestureDetector(
                    onTap: () {
                      // Aksi untuk mengubah gambar profil
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.blueGrey, width: 2),
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Username
            Text(
              username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),
            // User Details
            const Text(
              'Detail Akun:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Information Cards
            Expanded(
              child: ListView(
                children: [
                  _buildInfoCard('Email', 'user@example.com'),
                  _buildInfoCard('Nomor Telepon', '+62 123 456 7890'),
                  _buildInfoCard('Alamat', 'Jl. Contoh No. 123, Jakarta'),
                ],
              ),
            ),
            // Edit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk edit profil
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 50, 193, 245), // Background color
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255), // Text color
                ),
                child: const Text('Edit Profil'),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget untuk membuat card informasi
  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(value, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
