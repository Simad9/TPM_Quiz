import 'package:flutter/material.dart';
import '../all/import.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Silahkan Pilih Menu',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ButtonMenu(title: 'Layang-layang', widget: LayangPage()),
            SizedBox(height: 10),
            ButtonMenu(title: 'Tabung', widget: TabungPage()),
            SizedBox(height: 10),
            ButtonMenu(title: 'Hari', widget: HariPage()),
            SizedBox(height: 10),
            ButtonMenu(title: 'Diri Saya', widget: DiriPage()),
          ],
        ),
      ),
    );
  }
}
