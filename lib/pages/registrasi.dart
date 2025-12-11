import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController ageC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  bool isLoading = false;

  // function proses regis ke API
  Future<void>cekRegis()async{

    // proses ke api
    Map<String,dynamic> regisUser = {
      "firstname" : firstNameC.text,
      "lastname" : lastNameC.text,
      "age" : ageC.text,
      "email" : emailC.text,
    };
    var uri = Uri.parse(" https://dummyjson.com/users/add");
    
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
              Text(
                "Registrasi",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: "First Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Last Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Age",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
              ),           
          ],
        ),
        ),
    );
  }
}