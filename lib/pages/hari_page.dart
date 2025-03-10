import 'package:flutter/material.dart';
import 'package:kuis_mobile/all/import.dart';

class HariPage extends StatefulWidget {
  const HariPage({super.key});

  @override
  State<HariPage> createState() => _HariPageState();
}

class _HariPageState extends State<HariPage> {
  final TextEditingController _inputHari = TextEditingController();
  int? angka;
  String hari = 'Hasil Hari';

  void cekHari() {
    setState(() {
      if (int.tryParse(_inputHari.text) != null) {
        angka = int.parse(_inputHari.text);
        switch (angka) {
          case 1:
            hari = "Senin";
            break;
          case 2:
            hari = "Selasa";
            break;
          case 3:
            hari = "Rabu";
            break;
          case 4:
            hari = "Kamis";
            break;
          case 5:
            hari = "Jumat";
            break;
          case 6:
            hari = "Sabtu";
            break;
          case 7:
            hari = "Minggu";
            break;
          default:
            hari = "Input tidak tersedia";
            break;
        }
      } else {
        hari = "Input tidak valid";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Hari Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'Page ini adalah menghitung hari',
              style: TextStyle(fontSize: 18),
            ),
            Text("(1-7) : Senin-Minggu"),
            SizedBox(height: 20),
            TextField(
              controller: _inputHari,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Angka Hari'),
            ),
            SizedBox(height: 16),
            ButtonCek(callback: () => cekHari(), text: "Cek Hari"),
            SizedBox(height: 16),
            Text(
              "Hari : $hari",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
