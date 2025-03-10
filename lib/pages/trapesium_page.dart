import 'package:flutter/material.dart';
import 'dart:math';
import '../all/import.dart';

class TrapesiumPage extends StatefulWidget {
  const TrapesiumPage({super.key});

  @override
  State<TrapesiumPage> createState() => _TrapesiumPageState();
}

class _TrapesiumPageState extends State<TrapesiumPage> {
  final TextEditingController _inputSisiAtas = TextEditingController();
  final TextEditingController _inputSisiBawah = TextEditingController();
  final TextEditingController _inputTinggi = TextEditingController();

  String luas = "Hasil Luas";
  String keliling = "Hasil Keliling";

  void hitung() {
    setState(() {
      if (double.tryParse(_inputSisiAtas.text) != null &&
          double.tryParse(_inputSisiBawah.text) != null &&
          double.tryParse(_inputTinggi.text) != null) {
        double sisiAtas = double.parse(_inputSisiAtas.text);
        double sisiBawah = double.parse(_inputSisiBawah.text);
        double tinggi = double.parse(_inputTinggi.text);

        // Luas trapesium
        luas = (0.5 * (sisiAtas + sisiBawah) * tinggi).toStringAsFixed(2);

        // Menghitung Keliling
        double selisih = ((sisiAtas - sisiBawah).abs()) / 2;
        double sisiMiring = sqrt(selisih * selisih + tinggi * tinggi);
        keliling = (sisiAtas + sisiBawah + sisiMiring * 2)
            .toStringAsFixed(2); // keliling isometric
      } else {
        luas = "Input tidak sesuai";
        keliling = "Input tidak sesuai";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Trapesium Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Trapesium Semetris',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Menghitung Luas dan Keliling Trapesiuam',
            ),
            SizedBox(height: 20),
            TextField(
              controller: _inputSisiAtas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Sisi Atas Trapesium (a)'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _inputSisiBawah,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Sisi Bawah Trapesium (b)'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _inputTinggi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Sisi Tinggi Trapesium (t)'),
            ),
            SizedBox(height: 16),
            ButtonCek(callback: () => hitung(), text: "Hitung Rumus"),
            SizedBox(height: 16),
            Text(
              "Luas Trapesium : $luas",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Keliling Trapesium : $keliling",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text("Note : Trapesium Simetris adalah sisi miringnya sama"),
          ],
        ),
      ),
    );
  }
}
