import 'package:flutter/material.dart';
import './containers/addlist.dart';
import './containers/detail.dart';
import './containers/todo_item.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoLists(),
    );
  }
}

class TodoLists extends StatefulWidget {
  @override
  TodoListsState createState() => TodoListsState();
}

class TodoListsState extends State<TodoLists> {
  final _lists = <Todo>[];

  Widget _makeTodoLists(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i < _lists.length){
          //  Divider();
            
            final index = i;
            
            return Dismissible(
              // Show a red background as the item is swiped away.
              background: Container(
                color: Colors.redAccent,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.delete, color: Colors.white),
                      Text('Move to trash', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              key: Key(_lists[i].title),
              onDismissed: (direction) {
                String removeditem = _lists[index].title;
                setState(() {
                  _lists.removeAt(index);
                });

                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("Finished the item!  " + removeditem)));
              },
              child: Card(
                child: ListTile(
                  title: Text(_lists[i].title),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // 파라미터 todo로 tap된 index의 아이템을 전달
                        builder: (context) => Detail(todo: _lists[index]),
                      ),
                    );
                  },
                  ),
              )
            );
        
        }
       
     },
    );
  }

  _addTodoItem(item, des) {
    setState(() {

      _lists.add(Todo(item,des));
    });
  }

  _navigateAddlist() async {
    
    Map result = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return AddList();
      }),
    );
    if(result != null  && result.containsKey('title')){
      _addTodoItem(result['title'],result['des']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Todo List', style: TextStyle(color: Colors.white),),
      ),
      body: _makeTodoLists(),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAddlist,
        tooltip: '추가',
        child: Icon(Icons.add, color: Colors.white),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
