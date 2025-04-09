// lib/widgets/quiz_popup.dart
import 'package:flutter/material.dart';
import '../screens/quiz_screen.dart';

class QuizPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pilih Kuis'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
  leading: Image.asset(
    'assets/icon/Icon.png', // Gambar kustom kamu
    width: 40,
    height: 40,
  ),
  title: Text('Kuis Mahasiswa Baru D4 MI'),
  onTap: () {
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => QuizScreen()),
    );
  },
),

          // Tambahkan kuis lain jika perlu
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Tutup'),
        ),
      ],
    );
  }
}
