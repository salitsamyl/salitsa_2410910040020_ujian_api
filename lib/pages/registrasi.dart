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
    // rubah kondisi isLoading
    setState(() {
      isLoading = true;
    });

    // proses ke api
    Map<String,dynamic> regisUser = {
      "firstName" : firstNameC.text,
      "lastName" : lastNameC.text,
      "age" : int.parse(ageC.text),
      "email" : emailC.text,
    };
    var uri = Uri.parse("https://dummyjson.com/users/add");
    try {
      var respon = await http.post(uri, 
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regisUser),
      );
      if(respon.statusCode == 201){
        var data = jsonDecode(respon.body);
        String namaUser = data["firstName"] ?? "User";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Berhasil Mendaftar: $namaUser"),),
        );
        Navigator.pushReplacementNamed(context, "/todos");
      }else {
        throw Exception("Registrasi Gagal");
      }
    } catch (e) {
      // munculkan snapbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()))
        );
      } finally{
        setState(() {
          isLoading = false;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(  
          children: [
            SizedBox(height: 40),
              Text(
                "Registrasi",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextField(
              controller: firstNameC,
              decoration: InputDecoration(
                hintText: "First Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
              SizedBox(height: 10,),
              TextField(
                controller: lastNameC,
                decoration: InputDecoration(
                  hintText: "Last Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: ageC,
                decoration: InputDecoration(
                  hintText: "Age",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: emailC,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null :() {
                    cekRegis();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color.fromARGB(255, 64, 103, 134),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading ? CircularProgressIndicator(
                    color: Colors.white,
                  ) : Text("Masuk", style: TextStyle(color: Colors.white),),
                ),
              ),           
          ],
        ),
        ),
    );
  }
}