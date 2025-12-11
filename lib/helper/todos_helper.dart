import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salitsa_2410910040020_ujian_api/models/todos_model.dart';

class TodosHelper {
  Future<List<TodosModel>> getAllTodos() async {
    var uri = Uri.parse("https://dummyjson.com/todos");
    var respon = await http.get(uri);
    if (respon.statusCode == 200) {
      var data = jsonDecode(respon.body);
      List<dynamic> hasil = data["todos"];
      return hasil.map((json) => TodosModel.fromMap(json)).toList();
    } else {
      throw Exception("Koneksi Terganggu");
    }
  }
}
