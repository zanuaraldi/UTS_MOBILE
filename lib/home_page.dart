import 'package:flutter/material.dart';
import 'about_page.dart'; // Import About Page
import 'profile_page.dart'; // Import Profile Page
import 'cart_page.dart'; // Import Cart Page

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages to render based on BottomNavigationBar item
  final List<Widget> _pages;

  _HomePageState() : _pages = [
    const HomeContent(), // Home content to be defined in a separate widget
    const AboutPage(), // About Page
    ProfilePage(username: ''), // Placeholder for Profile Page
    const CartPage(), // Cart Page
  ];

  // Function to render pages based on selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      // Update ProfilePage with username when selected
      if (_selectedIndex == 2) {
        _pages[2] = ProfilePage(username: widget.username);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        backgroundColor: const Color.fromARGB(255, 5, 88, 153),
      ),
      body: _pages[_selectedIndex], // Show page based on selected index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 1, 169, 253),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

// HomeContent Widget to display the main content on the Home Page
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recommended Products
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Recommended Products',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildProductGrid(), // Grid for displaying products
        ],
      ),
    );
  }

  // Build a grid to display products
  Widget _buildProductGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: List.generate(4, (index) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/home8.jpg', // Change to appropriate product image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Product ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Text('\$${1000 * (100)}'), // Product price, example logic
            ],
          ),
        );
      }),
    );
  }
}
