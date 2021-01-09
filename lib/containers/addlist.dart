import 'package:flutter/material.dart';
class AddList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo List'),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '내용',
          contentPadding: EdgeInsets.all(20.0)
        ),
        autofocus: true,
        onSubmitted: (val){
          Navigator.of(context).pop({'data' : val});
        },
      ),
      ) 
    );
  }
}