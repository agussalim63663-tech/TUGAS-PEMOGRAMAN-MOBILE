import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum 05',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Flutter Sederhana'),
            centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 254, 255, 196),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: 40,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Halo! Ini adalah aplikasi sederhana yang di buat Menggunakan Flutter',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}