import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  const FirstPage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/maplestory_icon.webp',
            width: 300,
            // color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 60),
          Text(
            '楓谷小學堂',
            style: GoogleFonts.lato(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          FilledButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('start Quiz'),
          )
        ],
      ),
    );
  }
}
