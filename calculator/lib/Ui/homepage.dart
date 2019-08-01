import 'package:calculator/Bloc/checklegit.dart';
import 'package:calculator/Bloc/userbloc.dart';
import 'package:calculator/Models/user.dart';
import 'package:calculator/Sqlite/database.dart';
import 'package:flutter/material.dart';

import 'history.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator App',
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            color: Colors.white,
            splashColor: Colors.white,
            tooltip: 'See history',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => History()));
            },
          ),
        ],
      ),
      body: BodyPage(),
    );
  }
}
class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final bloc = UserBloc();
  List<String> listButton = [
    'AC','Del','%','/',
    '7','8','9','X',
    '4','5','6','-',
    '1','2','3','+',
    '','0','.','=',
  ];
  String result = '0', temp = '';
  String no1, no2;
  String  operand;
  int count = 0;
  List<User> listUser;
  implementButton(String btn){
    setState(() {
     if(checkCommand(btn)){
       if(btn == 'AC'){
         result = '0';
       }
     }
     else if(checkOperand(btn)) {
       if(btn == '='){
         //save 2nd number, calculate result and add to the string         
         no2 = temp;
         result = calculate(no1, no2, operand).toString();//add to the result
         temp = '';
        //  //add script and time to a user
          String script = '$no1 $operand $no2 = $result';//ex: a + b = c
          DateTime now = DateTime.now();
          String time = '${now.hour}:${now.minute}:${now.second} - ${now.day}/${now.month}/${now.year}';
          User us = User(description: script ,date: time);
          //add user to database
          bloc.addUser(us);
          //DBProvider.db.newUser(us);
       }
       else{
         //save 1st number to no1, reset the string and add save operand for calculate when user press '='
         no1 = temp;
         operand = btn;
         result = btn;
         temp = '';
       }       
     }
     else if(checkNumber(btn)){
       //add number to temp and update input
       temp += btn;
       result = temp;
     }     
    });
  }
  final width = 70.0;
  final height = 70.0;
  final fontSize = 30.0;
  @override
  void initState() {
    super.initState();
    //bloc.dispose();
  }
  @override
  Widget build(BuildContext context) { 
    return StreamBuilder(
      stream: bloc.listUser,
      builder: (context, snapshot){
        return  ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index){
        if(index == 0){
          //display result
          return Container(
            height: height * 3,
            alignment: Alignment.bottomRight,
            child: Text(result, style: TextStyle(fontSize: fontSize),),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0),
            ),
          );
        }
        //index - 1 to skill the row of result
        int i = index - 1;
        int i1 = 4 * i, i2 = 4 * i + 1, i3 = 4 * i + 2, i4 = 4 * i + 3;

        return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Expanded(        
          child: Container(
            width: width,
            height: height,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[i1], style: TextStyle(fontSize: fontSize),),
              onPressed: (){
                implementButton(listButton[i1]);
              },
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0),
            ),
          ),
        ),
        Expanded(        
          child: Container(
            width: width,
            height: height,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[i2], style: TextStyle(fontSize: fontSize),),
              onPressed: (){
                implementButton(listButton[i2]);
              },              
            ),
             decoration: BoxDecoration(
              border: Border.all(width: 2.0),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: width,
            height: height,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[i3], style: TextStyle(fontSize: fontSize),),
              onPressed: (){
                debugPrint(listButton[i3]);
               implementButton(listButton[i3]);
              },
            ),
             decoration: BoxDecoration(
              border: Border.all(width: 2.0),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: width,
            height: height,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[i4], style: TextStyle(fontSize: fontSize),),
              onPressed: (){
                implementButton(listButton[i4]);
              },
            ),
             decoration: BoxDecoration(
              border: Border.all(width: 2.0),
            ),
          ),
        ),
      ],
    );
      },
    );
      },
    );
   
  }
}
