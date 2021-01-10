import 'package:flutter/material.dart';

class AddList extends StatefulWidget{
  @override
  AddListState createState() => AddListState();
   static const routeName = '/add';
}

class AddListState extends State<AddList>{
  // 포커스노트 선언
  FocusNode desNode;
  FocusNode tieNode;

  // 폼이 생성될 때 호출
  @override
  void initState() {
    super.initState();
    // myFocusNode에 포커스 인스턴스 저장.
    desNode = FocusNode();
    tieNode = FocusNode();
  }
  // 폼이 삭제될 때 호출
  @override
  void dispose() {
    // 폼이 삭제되면 myFocusNode도 삭제됨
    desNode.dispose();
    tieNode.dispose();
    super.dispose();
  }
  String _title ='None';
    String _descrption ='None';
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo List', style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  contentPadding: EdgeInsets.all(20.0)
                ),
                autofocus: true,
                onSubmitted: (val){
                  
                  _title = val;
                  FocusScope.of(context).requestFocus(desNode);
                  // Navigator.of(context).pop({'title' : val});
                },
                focusNode: tieNode
              ),
            ), 
          ),
          Container(
            
            child : Padding(
                padding: const EdgeInsets.all(12.0),
                
                child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  contentPadding: EdgeInsets.all(20.0),
                  // contentPadding: new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                ),
                onSubmitted: (val){
                  _descrption = val;
                  // Navigator.of(context).pop({'title' : val});
                },
                focusNode: desNode,
                ),
              ), 
          ),
           
          
          Padding(  // 두번째 자식
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(  // 버튼 추가
                onPressed: (){  // 버튼이 눌리면
                  print(_title +"  /   "+ _descrption);
                  if(_title != 'None' && _descrption != 'None'){
                    Navigator.of(context).pop({'title' : _title, 'des' :_descrption});
                  }
                  else if(_title == 'None'){
                    FocusScope.of(context).requestFocus(tieNode);
                  } else if(_descrption == 'None'){
                    FocusScope.of(context).requestFocus(desNode);
                  }
               },
                child: Text('Make todo.'),
              ),
            ),
       ],
      )
     
    );
  }
}