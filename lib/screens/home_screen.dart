// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/quiz_popup.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202A44),
      appBar: AppBar(
        title: Text('MInter'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => QuizPopup(),
            );
          },
          child: Text('Mulai Kuis'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
