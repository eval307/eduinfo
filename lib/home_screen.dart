import 'package:flutter/material.dart';
import 'setting.dart';
import 'profile.dart';
import 'main.dart';
import 'navbar.dart';
import 'news_detail.dart'; // Import the news detail page

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/karate.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Program Section
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: const Color(0xFFE6EBF0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5, bottom: 10),
                            child: Text(
                              'Program',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 220,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildProgramCard(
                                  'Juara 1',
                                  'OZSN cabang karate tingkat Provinsi Jawa Timur',
                                  'assets/program1.jpg',
                                ),
                                _buildProgramCard(
                                  'Juara 2',
                                  'OZSN cabang karate tingkat Provinsi Jawa Timur',
                                  'assets/program2.jpg',
                                ),
                                _buildProgramCard(
                                  '',
                                  '',
                                  'assets/program3.jpg',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Berita Terbaru Section
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: const Color(0xFFE6EBF0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5, bottom: 10),
                            child: Text(
                              'Berita Terbaru',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          _buildNewsCard(
                            'Juara Harapan 1 Festival Anak Muslim',
                            'Prestasi kembali ditorehkan oleh siswa SMPN 15 Malang  M. Akbarul.',
                            'assets/news1.jpg',
                            'Pada acara Festival Anak Muslim yang diadakan di Malang pada tanggal 10 Mei 2025, siswa SMPN 15 Malang berhasil meraih juara harapan 1. M. Akbarul menunjukkan performa luar biasa dalam kompetisi ini dengan menampilkan teknik karate yang sempurna.',
                          ),
                          const SizedBox(height: 15),
                          _buildNewsCard(
                            'Latihan Intensif Tim Karate',
                            'Tim karate melakukan persiapan intensif untuk kompetisi tingkat nasional bulan depan.',
                            'assets/news2.jpg',
                            'Menghadapi kompetisi nasional yang akan diadakan bulan depan, tim karate telah melakukan latihan intensif selama dua minggu terakhir. Pelatih menekankan pentingnya konsistensi dan fokus dalam setiap gerakan untuk meningkatkan peluang meraih medali.',
                          ),
                          const SizedBox(height: 15),
                          _buildNewsCard(
                            'Workshop Teknik Karate',
                            'Workshop teknik karate terbaru diadakan untuk meningkatkan kemampuan atlet.',
                            'assets/news3.jpg',
                            'Workshop teknik karate yang diadakan pada akhir pekan lalu dihadiri oleh lebih dari 50 atlet dari berbagai daerah. Workshop ini membahas teknik-teknik terbaru dan strategi pertandingan yang efektif untuk meningkatkan performa atlet dalam kompetisi.',
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
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;

            if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            }
          });
        },
      ),
    );
  }

  Widget _buildProgramCard(String title, String description, String imagePath) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(String title, String description, String imagePath, String fullContent) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(
              title: title,
              content: fullContent,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: AspectRatio(
                aspectRatio: 16 / 9, // Standardized aspect ratio for all images
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Baca selengkapnya...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2D3E50),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}