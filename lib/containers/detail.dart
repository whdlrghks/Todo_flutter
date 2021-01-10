import 'package:flutter/material.dart';
import './todo_item.dart';
class Detail extends StatelessWidget{
  final Todo todo;

   const Detail({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(todo.title),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(todo.description),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _navigateAddlist,
        tooltip: '추가',
        child: Icon(Icons.edit, color: Colors.white),
      ), 
    );
    throw UnimplementedError();
  }
}