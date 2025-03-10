import 'package:flutter/material.dart';

class ButtonCek extends StatelessWidget {
  const ButtonCek({super.key, required this.callback, required this.text});

  final VoidCallback callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      child: Text(text),
    );
  }
}
