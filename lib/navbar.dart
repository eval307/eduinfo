import 'package:flutter/material.dart';
import 'setting.dart';
import 'home_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsPage()),
          );
        } else {
          onTap(index);
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF2D3E50),
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HomeScreen'),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Berita Utama'),
        BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Formulir'),
        BottomNavigationBarItem(icon: Icon(Icons.photo_camera), label: 'Pengaturan'),
      ],
    );
  }
}
