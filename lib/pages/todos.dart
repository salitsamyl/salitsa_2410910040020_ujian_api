import 'package:flutter/material.dart';
import 'package:salitsa_2410910040020_ujian_api/helper/todos_helper.dart';
import 'package:salitsa_2410910040020_ujian_api/models/todos_model.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos Page"),),
        body: FutureBuilder(
          future: TodosHelper().getAllTodos(),
          builder: (context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasData){
              List<TodosModel> todos = snapshot.data!;
            }
            return ListView.builder(
              itemBuilder: (context, index){
                return Padding(padding: EdgeInsets.all(20),
                child: Text(todos[index]),
                );
              }
            );
          },
        ),
    );
  }
}