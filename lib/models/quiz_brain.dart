import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      questionText: 'Dimana UNESA berada?',
      options: ['Bandung', 'Surabaya', 'Jakarta', 'Medan'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Di kampus mana D4 MI UNESA berada?',
      options: ['Ketintang', 'Lidah Wetan', 'Magetan', 'Gunung Anyar'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'D4 Manajemen Informatika UNESA termasuk dalam fakultas apa?',
      options: ['Fakultas Teknik', 'Fakultas Vokasi', 'Fakultas Ilmu Komputer', 'Fakultas Ekonomi'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Siapa KAPRODI D4 Manajemen Informatika sekarang?',
      options: [
        'Asmunin,S.Kom.,M.Kom',
        'I Gde Agung Sri Sidhimantra,S.Kom., M.Kom',
        'Dodik Arwin Dermawan,S.ST.,ST.,MT, M.Kom',
        'Hafizhuddin Zul Fahi,S.Kom.,M.Sc.'
      ],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Lulusan D4MI UNESA dapat bekerja di bidang berikut, kecuali...',
      options: ['Software Developer', 'Data Analyst', 'Dokter Umum', 'IT Support'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Apa mata kuliah dasar yang biasanya dipelajari di awal perkuliahan D4MI?',
      options: ['Rekayasa Perangkat Lunak', 'Algoritma dan Pemrograman', 'Jaringan Komputer', 'Sistem Operasi'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Apa nama organisasi kemahasiswaan tingkat prodi di D4MI UNESA?',
      options: ['HIMAKOM', 'HIMATIF', 'HIMAFORTIC', 'BEM Vokasi'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Apa gelar yang diperoleh setelah lulus dari D4 Manajemen Informatika UNESA?',
      options: ['S.Kom', 'A.Md', 'S.M.Ikom', 'S.Tr.Kom'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'Salah satu keunggulan dari program D4 MI UNESA adalah...?',
      options: [
        'Banyak studi ke luar negeri',
        'Fokus pada keterampilan siap kerja di bidang IT',
        'Hanya belajar teori saja',
        'Tidak memiliki tugas akhir'
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Apa kegiatan non-akademik yang bisa diikuti mahasiswa D4 MI UNESA?',
      options: [
        'UKM dan Organisasi Kemahasiswaan',
        'Hanya kuliah saja',
        'Pelatihan Memasak',
        'Lomba Tarian Tradisional'
      ],
      correctAnswerIndex: 0,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  List<String> getQuestionOptions() {
    return _questionBank[_questionNumber].options;
  }

  int getCorrectAnswerIndex() {
    return _questionBank[_questionNumber].correctAnswerIndex;
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  int totalQuestions() {
    return _questionBank.length;
  }

  void reset() {
    _questionNumber = 0;
  }
}
