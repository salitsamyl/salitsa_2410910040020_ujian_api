import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "First Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Age"),
            ),
          ],
        ),
        ),
    );
  }
}