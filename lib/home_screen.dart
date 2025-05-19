import 'package:flutter/material.dart';
import 'setting.dart';
import 'profile.dart';
import 'main.dart';
import 'navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentBottomNavIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            color: const Color(0xFF2D3E50),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nama : Valhazz',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      'Email : Evalyto@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: const [
                      Text('Cari...', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 5),
                      Icon(Icons.search, color: Colors.grey, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner
                  Container(
                    width: double.infinity,
                    height: 200,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/karate.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Program Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: const Color(0xFFE6EBF0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Program',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 220,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            children: [
                              _buildProgramCard(0),
                              _buildProgramCard(1),
                              _buildProgramCard(2),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                                (index) => Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ✅ Pakai Custom Bottom Navbar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;

            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            }
          });
        },
      ),
    );
  }

  Widget _buildProgramCard(int index) {
    String title = '';
    String description = '';
    String imagePath = '';

    switch (index) {
      case 0:
        title = 'Juara 1';
        description = 'OZSN cabang karate tingkat Provinsi Jawa Timur';
        imagePath = 'assets/program1.jpg';
        break;
      case 1:
        title = 'Juara 2';
        description = 'OZSN cabang karate tingkat Provinsi Jawa Timur';
        imagePath = 'assets/program2.jpg';
        break;
      case 2:
        title = '';
        description = '';
        imagePath = 'assets/program3.jpg';
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
