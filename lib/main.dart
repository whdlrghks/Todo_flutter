import 'package:flutter/material.dart';
import './containers/addlist.dart';
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
        primarySwatch: Colors.grey,
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
  final _lists = <String>[];
  final controller =ScrollController();
  double offset = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  Widget _makeTodoLists(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i < _lists.length){
          //  Divider();
            
            final index = i;
            
            return Dismissible(
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              key: Key(_lists[i]),
              onDismissed: (direction) {
                String removeditem = _lists[index];
                setState(() {
                  _lists.removeAt(index);
                });

                Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("Finished the item!  " + removeditem)));
              },
              child: Card(
                child: ListTile(title: Text(_lists[i])),
              )
            );
        
        }
       
     },
    );
  }

  _addTodoItem(item) {
    setState(() {
      _lists.add(item);
    });
  }

  _navigateAddlist() async {
    Map result = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return AddList();
      }),
    );
    
    if(result != null  && result.containsKey('data')){
      _addTodoItem(result['data']);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Todo List'),
      ),
      body: _makeTodoLists(),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAddlist,
        tooltip: '추가',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
