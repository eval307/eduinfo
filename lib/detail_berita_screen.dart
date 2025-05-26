import 'package:flutter/material.dart';

class DetailBeritaScreen extends StatelessWidget {
  final int beritaId;
  final String judul;
  final String ringkasan;
  final String waktu;
  final String gambar;

  const DetailBeritaScreen({
    Key? key,
    required this.beritaId,
    required this.judul,
    required this.ringkasan,
    required this.waktu,
    required this.gambar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Konten lengkap untuk setiap berita berdasarkan ID
    Map<int, Map<String, dynamic>> detailBerita = {
      1: {
        'konten': '''
Pemerintah Indonesia resmi meluncurkan Program Digitalisasi UMKM Nasional sebagai upaya mendorong transformasi digital sektor usaha mikro, kecil, dan menengah di seluruh nusantara.

Program ini mencakup berbagai inisiatif strategis:

**Pelatihan Digital Marketing**
Memberikan pelatihan komprehensif kepada pelaku UMKM tentang strategi pemasaran digital, penggunaan media sosial, dan platform e-commerce.

**Bantuan Teknologi**
Penyediaan akses ke platform digital dan tools yang diperlukan untuk mengembangkan bisnis online, termasuk website builder dan sistem manajemen inventory.

**Dukungan Finansial**
Program kredit khusus dengan bunga rendah untuk mendukung investasi teknologi dan pengembangan infrastruktur digital UMKM.

**Mentoring dan Pendampingan**
Tim ahli akan memberikan pendampingan berkelanjutan untuk memastikan implementasi digitalisasi berjalan optimal.

Target program ini adalah mengdigitalisasi 1 juta UMKM dalam 2 tahun ke depan, dengan harapan dapat meningkatkan daya saing dan jangkauan pasar produk lokal.
        ''',
        'penulis': 'Redaksi Ekonomi',
        'kategori': 'Ekonomi',
        'tags': ['UMKM', 'Digitalisasi', 'Ekonomi Digital']
      },
      2: {
        'konten': '''
Pemerintah daerah mengumumkan rencana ambisius untuk meningkatkan infrastruktur transportasi di berbagai kota besar Indonesia guna mengatasi masalah kemacetan dan polusi udara.

**Proyek Utama yang Diluncurkan:**

**Sistem Bus Rapid Transit (BRT) Terintegrasi**
Pengembangan koridor BRT baru yang terhubung dengan stasiun kereta api dan terminal bus eksisting untuk menciptakan sistem transportasi yang seamless.

**Jalur Sepeda Terpadu**
Pembangunan jalur khusus sepeda sepanjang 500 km yang menghubungkan pusat bisnis, perumahan, dan fasilitas publik.

**Smart Traffic Management**
Implementasi sistem manajemen lalu lintas pintar menggunakan AI dan IoT untuk mengoptimalkan arus kendaraan dan mengurangi waktu tempuh.

**Electric Vehicle Infrastructure**
Pembangunan stasiun pengisian kendaraan listrik di berbagai titik strategis untuk mendukung transisi ke transportasi ramah lingkungan.

**Park and Ride Facilities**
Pengembangan area parkir terintegrasi dengan transportasi umum untuk mengurangi penggunaan kendaraan pribadi di pusat kota.

Proyek ini diharapkan dapat mengurangi kemacetan hingga 40% dan emisi gas buang hingga 30% dalam 5 tahun ke depan.
        ''',
        'penulis': 'Tim Infrastruktur',
        'kategori': 'Infrastruktur',
        'tags': ['Transportasi', 'Smart City', 'Lingkungan']
      },
      3: {
        'konten': '''
Kementerian Pendidikan dan Kebudayaan membuka pendaftaran Program Beasiswa Pendidikan Tinggi 2024 yang menyasar mahasiswa berprestasi dari keluarga kurang mampu.

**Detail Program Beasiswa:**

**Cakupan Beasiswa**
- Biaya kuliah penuh selama masa studi
- Bantuan biaya hidup bulanan
- Tunjangan buku dan peralatan akademik
- Asuransi kesehatan

**Kriteria Penerima**
- IPK minimal 3.5 untuk mahasiswa aktif
- Nilai rapor minimal 85 untuk calon mahasiswa baru
- Penghasilan orang tua maksimal Rp 4 juta per bulan
- Aktif dalam kegiatan sosial atau organisasi

**Program Studi Prioritas**
- Teknik dan Teknologi
- Kesehatan dan Kedokteran
- Pendidikan dan Keguruan
- Pertanian dan Kehutanan
- Ekonomi dan Bisnis

**Proses Seleksi**
1. Seleksi administrasi berkas
2. Tes tertulis dan wawancara
3. Verifikasi lapangan kondisi ekonomi keluarga
4. Pengumuman hasil seleksi

**Fasilitas Tambahan**
- Program magang di perusahaan terkemuka
- Pelatihan soft skills dan leadership
- Akses ke perpustakaan digital nasional
- Jaringan alumni yang luas

Pendaftaran dibuka mulai 1 Juni hingga 31 Juli 2024 melalui portal resmi beasiswa.kemdikbud.go.id.
        ''',
        'penulis': 'Divisi Beasiswa',
        'kategori': 'Pendidikan',
        'tags': ['Beasiswa', 'Pendidikan', 'Mahasiswa']
      },
      4: {
        'konten': '''
Kementerian Kesehatan bekerja sama dengan berbagai organisasi meluncurkan kampanye nasional untuk meningkatkan kesadaran tentang pentingnya kesehatan mental di lingkungan kerja.

**Latar Belakang Program**
Berdasarkan survei terbaru, 65% pekerja di Indonesia mengalami stress kerja yang berdampak pada produktivitas dan kesejahteraan personal.

**Komponen Kampanye:**

**Workshop dan Seminar**
- Pengenalan tanda-tanda gangguan kesehatan mental
- Teknik manajemen stress dan work-life balance
- Cara membangun lingkungan kerja yang supportive

**Mental Health First Aid Training**
Pelatihan bagi HR dan supervisor untuk mendeteksi dan memberikan pertolongan pertama pada masalah kesehatan mental karyawan.

**Fasilitas Konseling**
- Hotline konseling 24/7 gratis
- Sesi konseling online dan offline
- Program Employee Assistance Program (EAP)

**Kebijakan Workplace Wellness**
- Flexible working hours
- Mental health days
- Ruang relaksasi di kantor
- Program olahraga dan meditasi

**Digital Platform**
Aplikasi mobile untuk:
- Self-assessment kesehatan mental
- Akses ke konten edukasi
- Booking sesi konseling
- Community support group

**Target dan Manfaat**
Program ini menargetkan 10,000 perusahaan dan 2 juta pekerja di tahun pertama, dengan harapan dapat mengurangi tingkat absensi karena stress hingga 25% dan meningkatkan produktivitas kerja.

Perusahaan yang berpartisipasi akan mendapatkan sertifikasi "Mental Health Friendly Workplace" sebagai bentuk apresiasi komitmen terhadap kesejahteraan karyawan.
        ''',
        'penulis': 'Tim Kesehatan Mental',
        'kategori': 'Kesehatan',
        'tags': ['Kesehatan Mental', 'Workplace', 'Wellbeing']
      },
      5: {
        'konten': '''
Indonesia memimpin dalam pengembangan teknologi hijau dengan meluncurkan berbagai inovasi ramah lingkungan untuk mengatasi tantangan perubahan iklim.

**Inovasi Teknologi Hijau Terdepan:**

**Solar Panel Efisiensi Tinggi**
Pengembangan panel surya generasi baru dengan efisiensi konversi energi hingga 45%, menggunakan material perovskite yang dikombinasikan dengan silikon.

**Biogas dari Sampah Organik**
Teknologi konversi sampah organik menjadi biogas dengan kapasitas produksi 1000 m³ per hari dari 10 ton sampah organik.

**Smart Grid System**
Sistem jaringan listrik pintar yang dapat mengoptimalkan distribusi energi renewable dan mengurangi losses hingga 15%.

**Carbon Capture Technology**
Teknologi penangkapan dan penyimpanan karbon yang dapat mengurangi emisi CO2 industri hingga 90%.

**Electric Vehicle Battery**
Pengembangan baterai kendaraan listrik dengan daya tahan 1000 km sekali charge menggunakan teknologi graphene.

**Vertical Farming System**
Sistem pertanian vertikal yang dapat menghemat lahan hingga 95% dan air hingga 70% dibanding pertanian konvensional.

**Implementasi dan Dampak:**

**Sektor Industri**
- 500 pabrik telah mengadopsi teknologi hijau
- Pengurangan emisi industri sebesar 30%
- Penghematan energi hingga 40%

**Sektor Transportasi**
- 50,000 kendaraan listrik beroperasi
- 1,000 stasiun charging tersedia
- Reduksi emisi transportasi 20%

**Sektor Energi**
- 35% energi nasional dari renewable
- Target 50% pada 2030
- Investasi teknologi hijau Rp 100 triliun

**Kolaborasi Internasional**
Indonesia menjalin kerjasama dengan 20 negara untuk transfer teknologi dan sharing best practices dalam pengembangan teknologi hijau.

Program ini diharapkan dapat menjadikan Indonesia sebagai leader regional dalam teknologi hijau dan mencapai net zero emission pada 2060.
        ''',
        'penulis': 'Tim Teknologi Hijau',
        'kategori': 'Teknologi',
        'tags': ['Teknologi Hijau', 'Lingkungan', 'Inovasi']
      },
    };

    var berita = detailBerita[beritaId]!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar dengan Gambar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF2563EB),
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    gambar,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              size: 64,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Gambar tidak dapat dimuat',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Konten Detail
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge Kategori
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2563EB).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      berita['kategori'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Judul Berita
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Info Penulis dan Waktu
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color(0xFF2563EB).withOpacity(0.1),
                        child: Icon(
                          Icons.person,
                          size: 18,
                          color: const Color(0xFF2563EB),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        berita['penulis'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        waktu,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Ringkasan
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF2563EB).withOpacity(0.2),
                      ),
                    ),
                    child: Text(
                      ringkasan,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1F2937),
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Konten Berita
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        berita['konten'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F2937),
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tags
                  const Text(
                    'Tags:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (berita['tags'] as List<String>).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.withOpacity(0.3)),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),

                  // Tombol Aksi
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Fitur berbagi akan segera tersedia!'),
                                backgroundColor: Color(0xFF2563EB),
                              ),
                            );
                          },
                          icon: const Icon(Icons.share, color: Colors.white),
                          label: const Text(
                            'Bagikan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Berita disimpan ke favorit!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          icon: const Icon(Icons.bookmark_outline, color: Color(0xFF2563EB)),
                          label: const Text(
                            'Simpan',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF2563EB)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}