import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Auto slide setiap 3 detik
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return false;

      _currentPage = (_currentPage + 1) % 3;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ====== BODY ======
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  hintText: 'Search',
                ),
              ),
            ),

            // Slider otomatis
            SizedBox(
              height: 150,
              child: PageView(
                controller: _pageController,
                children: const [
                  _SliderImage("assets/images/image-1.jpg"),
                  _SliderImage("assets/images/image-2.jpg"),
                  _SliderImage("assets/images/image-3.jpg"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Kategori
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Column(
                    children: [
                      Icon(Icons.star, size: 35),
                      SizedBox(height: 6),
                      Text("Favorit"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.shopping_cart, size: 35),
                      SizedBox(height: 6),
                      Text("Belanja"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.phone_android, size: 35),
                      SizedBox(height: 6),
                      Text("Gadget"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.food_bank, size: 35),
                      SizedBox(height: 6),
                      Text("Makanan"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.sports_esports, size: 35),
                      SizedBox(height: 6),
                      Text("Game"),
                    ],
                  ),
                ],
              ),
            ),

            // ============================
            //   ⬇️  PRODUK 4 ROW × 2 KOLOM
            // ============================
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [ProductItem(), ProductItem()],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [ProductItem(), ProductItem()],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [ProductItem(), ProductItem()],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [ProductItem(), ProductItem()],
                ),
              ],
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),

      // Bottom Navbar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Kategori",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorit"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
        ],
      ),
    );
  }
}

// Slider widget
class _SliderImage extends StatelessWidget {
  final String path;
  const _SliderImage(this.path);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}

// Produk item 1x
class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Gambar
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[300],
            image: const DecorationImage(
              image: AssetImage("assets/images/image-1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 8),

        // Nama
        SizedBox(
          width: 120,
          child: Text(
            "Nama Produk",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(height: 4),

        // Rating
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 16),
            SizedBox(width: 4),
            Text("4.6"),
          ],
        ),

        SizedBox(height: 4),

        // Harga
        const Text("Rp 25.000", style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
