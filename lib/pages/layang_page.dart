import 'package:flutter/material.dart';
import '../all/import.dart';
import 'dart:math';

class LayangPage extends StatefulWidget {
  const LayangPage({super.key});

  @override
  State<LayangPage> createState() => _LayangPageState();
}

class _LayangPageState extends State<LayangPage> {
  final TextEditingController _inputDiagonalSatu = TextEditingController();
  final TextEditingController _inputDiagonalDua = TextEditingController();

  String luas = "Hasil Luas";
  String keliling = "Hasil Keliling";

  void hitung() {
    setState(() {
      if (double.tryParse(_inputDiagonalSatu.text) != null &&
          double.tryParse(_inputDiagonalDua.text) != null) {
        double diagonalSatu = double.parse(_inputDiagonalSatu.text);
        double diagonalDua = double.parse(_inputDiagonalDua.text);

        // Luas Layang-layang
        luas = (0.5 * diagonalSatu * diagonalDua).toStringAsFixed(2);

        // Keliling Layang-layang
        double sisiMiring =
            sqrt(pow(diagonalSatu / 2, 2) + pow(diagonalDua / 2, 2));
        keliling = (2 * (sisiMiring + sisiMiring)).toStringAsFixed(2);
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
          "Layang-layang Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Layang-Layang',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Menghitung Luas dan Keliling Layang-layang',
            ),
            SizedBox(height: 20),
            TextField(
              controller: _inputDiagonalSatu,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Diagonal Satu (d1)'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _inputDiagonalDua,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Diagonal Dua (d2)'),
            ),
            SizedBox(height: 16),
            ButtonCek(callback: () => hitung(), text: "Hitung Rumus"),
            SizedBox(height: 16),
            Text(
              "Luas Layang-layang : $luas",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Keliling Layang-layang : $keliling",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
