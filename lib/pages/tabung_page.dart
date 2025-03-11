import 'package:flutter/material.dart';
import 'dart:math';
import '../all/import.dart';

class TabungPage extends StatefulWidget {
  const TabungPage({super.key});

  @override
  State<TabungPage> createState() => _TabungPageState();
}

class _TabungPageState extends State<TabungPage> {
  final TextEditingController _inputJariJari = TextEditingController();
  final TextEditingController _inputTinggi = TextEditingController();

  String volume = "Hasil Volume";
  String keliling = "Hasil Keliling";

  void hitung() {
    if (double.tryParse(_inputJariJari.text) != null &&
        double.tryParse(_inputTinggi.text) != null) {
      double jariJari = double.parse(_inputJariJari.text);
      double tinggi = double.parse(_inputTinggi.text);
      setState(() {
        volume = (pi * pow(jariJari, 2) * tinggi).toStringAsFixed(2);
        keliling = (2 * pi * jariJari).toStringAsFixed(2);
      });
    } else {
      setState(() {
        volume = "Input tidak sesuai";
        keliling = "Input tidak sesuai";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Tabung Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Tabung',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Menghitung Volume dan Keliling Tabung',
            ),
            SizedBox(height: 20),
            TextField(
              controller: _inputJariJari,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Sisi Tabung'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _inputTinggi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Sisi Tabung'),
            ),
            SizedBox(height: 16),
            ButtonCek(callback: () => hitung(), text: "Hitung Rumus"),
            SizedBox(height: 16),
            Text(
              "Volume Tabung : $volume",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Keliling Tabung : $keliling",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
