
import 'package:flutter/material.dart';
import 'package:salitsa_2410910040020_ujian_api/pages/registrasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    // debugShowCheckedModeBanner: false,
      home: Registrasi(),  
    );
  }
}
