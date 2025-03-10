import 'package:flutter/material.dart';
import '../all/import.dart';

class KubusPage extends StatefulWidget {
  const KubusPage({super.key});

  @override
  State<KubusPage> createState() => _KubusPageState();
}

class _KubusPageState extends State<KubusPage> {
  final TextEditingController _inputSisi = TextEditingController();

  String volume = "Hasil Volume";
  String keliling = "Hasil Keliling";

  void hitung() {
    if (double.tryParse(_inputSisi.text) != null) {
      double sisi = double.parse(_inputSisi.text);
      setState(() {
        volume = (sisi * sisi * sisi).toStringAsFixed(2);
        keliling = (sisi * 12).toStringAsFixed(2);
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
          "Kubus Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Kubus',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Menghitung Volume dan Keliling Kubus',
            ),
            SizedBox(height: 20),
            TextField(
              controller: _inputSisi,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Sisi Kubus'),
            ),
            SizedBox(height: 16),
            ButtonCek(callback: () => hitung(), text: "Hitung Rumus"),
            SizedBox(height: 16),
            Text(
              "Volume Kubus : $volume",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Keliling Kubus : $keliling",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
