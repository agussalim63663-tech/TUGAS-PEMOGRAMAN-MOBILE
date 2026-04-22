import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Wisata',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

/// ================= MODEL =================
class Wisata {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final String gambar;

  Wisata({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.gambar,
  });
}

/// ================= DATA =================
List<Wisata> wisataList = [
  Wisata(
    nama: "Pantai Kuta",
    lokasi: "Bali",
    deskripsi: "Pantai terkenal dengan pasir putih dan sunset.",
    gambar: "assets/kuta.jpg",
  ),
  Wisata(
    nama: "Raja Ampat",
    lokasi: "Papua",
    deskripsi: "Surga bawah laut dengan keindahan alam luar biasa.",
    gambar: "assets/rajaampat.jpg",
  ),
  Wisata(
    nama: "Gunung Bromo",
    lokasi: "Jawa Timur",
    deskripsi: "Gunung aktif dengan pemandangan sunrise yang indah.",
    gambar: "assets/bromo.jpg",
  ),
];

/// ================= HOME PAGE =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Wisata"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Image.asset(
                wisata.gambar,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(wisata.nama),
              subtitle: Text(wisata.lokasi),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(wisata: wisata),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

/// ================= DETAIL PAGE =================
class DetailPage extends StatelessWidget {
  final Wisata wisata;

  const DetailPage({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              wisata.gambar,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                wisata.nama,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  const SizedBox(width: 5),
                  Text(wisata.lokasi),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                wisata.deskripsi,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}