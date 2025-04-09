// lib/screens/quiz_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;
  bool showFeedback = false;
  String feedbackText = '';
  bool isCorrect = false;
  Timer? _timer;
  int timeLeft = 10;
  bool hasAnswered = false;

  void startTimer() {
    timeLeft = 10;
    hasAnswered = false;
    _timer?.cancel(); // Hindari multiple timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          if (!hasAnswered) _showTimeout();
        }
      });
    });
  }

  void _showTimeout() {
    setState(() {
      showFeedback = true;
      feedbackText = 'Waktu Habis!⏰';
      isCorrect = false;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showFeedback = false;
      });
      _nextStep();
    });
  }

  void _showAnswer(int selectedIndex) {
    hasAnswered = true;
    int correctIndex = quizBrain.getCorrectAnswerIndex();

    setState(() {
      isCorrect = selectedIndex == correctIndex;
      feedbackText = isCorrect
          ? 'Benar cuy! 🎉👏'
          : 'Yah salah sob 😬\nYang bener: ${quizBrain.getQuestionOptions()[correctIndex]}';
      if (isCorrect) score++;
      showFeedback = true;
      _timer?.cancel();
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showFeedback = false;
      });
      _nextStep();
    });
  }

  void _nextStep() {
    if (quizBrain.isFinished()) {
      _showFinalResult();
    } else {
      quizBrain.nextQuestion();
      startTimer();
    }
  }

  void _showFinalResult() {
    double percentage = (score / quizBrain.totalQuestions()) * 100;
    String message;

    if (percentage == 100) {
      message = "Wuih, 100%! anak MI sejati nih boss🔥🎯 🌟";
    } else if (percentage >= 80) {
      message = "Cuma kurang dikit, tapi tetep GOKIL sih! 😎";
    } else if (percentage >= 60) {
      message = "Ubur-ubur ikan lele belajar lagi ya le 💡";
    } else {
      message = "Yahhh... ini sih belum ngopi dulu kayaknya 😵 Coba lagi yok, bisa kok!";
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text('Hasil Kuis'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Skor kamu: $score dari ${quizBrain.totalQuestions()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Coba Lagi'),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                score = 0;
                quizBrain.reset();
                startTimer();
              });
            },
          ),
          TextButton(
            child: Text('Kembali'),
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
              Navigator.of(context).pop(); // back to previous screen
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    quizBrain.reset();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = quizBrain.getQuestionOptions();

    return Scaffold(
      backgroundColor: Color(0xFF202A44),
      appBar: AppBar(
        backgroundColor: Color(0xFF202A44),
        elevation: 0,
        title: Text(
          '🔥 Kuis MaBa MI 🔥',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: timeLeft / 10,
              minHeight: 10,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation(Color(0xFF4ECDC4)),
            ),
            SizedBox(height: 20),
            Text(
              quizBrain.getQuestionText(),
              style: TextStyle(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            if (!showFeedback)
              ...List.generate(options.length, (index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4ECDC4),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => _showAnswer(index),
                    child: Text(
                      options[index],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                );
              }),
            if (showFeedback)
              Text(
                feedbackText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: isCorrect ? Color(0xFFA3E635) : Color(0xFFF87171),
                  fontWeight: FontWeight.bold,
                ),
              ),
            Spacer(),
            Text(
              'Skor Lo: $score 💥',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
