import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view/berita.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MODUL 6 MANDIRI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const BeritaPage(),
    );
  }
}
