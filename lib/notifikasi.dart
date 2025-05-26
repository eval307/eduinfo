import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Notifikasi',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black87),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Filter Tabs
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildFilterChip('Semua', true),
                  SizedBox(width: 8),
                  _buildFilterChip('Belum Dibaca', false),
                  SizedBox(width: 8),
                  _buildFilterChip('Penting', false),
                ],
              ),
            ),

            // Notifications List
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  _buildNotificationCard(
                    title: 'Berita Terbaru: ',
                    subtitle: 'Pemerintah mengumumkan kebijakan baru terkait sistem pendidikan nasional untuk tahun 2025',
                    time: '15 menit yang lalu',
                    icon: Icons.newspaper,
                    iconColor: Colors.blue,
                    isRead: false,
                  ),

                  _buildNotificationCard(
                    title: 'Peringatan: Pelanggaran Tata Tertib',
                    subtitle: 'Terdeteksi pelanggaran tata tertib di area parkir. Mohon untuk mematuhi aturan yang berlaku',
                    time: '2 jam yang lalu',
                    icon: Icons.warning,
                    iconColor: Colors.red,
                    isRead: false,
                  ),
                  _buildNotificationCard(
                    title: 'Sanksi: Keterlambatan Pembayaran Kas Kelas',
                    subtitle: 'Reminder untuk siswa yang belum melunasi kas.',
                    time: '8 jam yang lalu',
                    icon: Icons.gavel,
                    iconColor: Colors.red,
                    isRead: true,
                  ),
                  _buildNotificationCard(
                    title: 'Pelanggaran: Parkir Sembarangan',
                    subtitle: 'Kendaraan dengan plat B 1234 XYZ melanggar aturan parkir. Segera pindahkan kendaraan',
                    time: '1 hari yang lalu',
                    icon: Icons.local_parking,
                    iconColor: Colors.red,
                    isRead: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String subtitle,
    required String time,
    required IconData icon,
    required Color iconColor,
    required bool isRead,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isRead ? FontWeight.normal : FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (!isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}