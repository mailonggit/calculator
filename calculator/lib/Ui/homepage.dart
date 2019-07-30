import 'package:calculator/checklegit.dart';
import 'package:calculator/history.dart';
import 'package:calculator/user.dart';
import 'package:flutter/material.dart';
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
            color: Colors.red,
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
  List<String> listButton = [
    'AC','Del','%','/',
    '7','8','9','X',
    '4','5','6','-',
    '1','2','3','+',
    '','0','.','=',
  ];
  String input = '0';
  String no1, no2, result;
  String temp = '', operand;
  List<User> listUser;
  implementButton(String btn){
    setState(() {
     if(checkCommand(btn)){
       if(btn == 'AC'){
         input = '0';
         temp = '';
       }
      //  else if(btn == 'x'){
      //    int length = temp.length;
      //    input = temp.substring(1, length - 1);
      //    debugPrint(input);
      //    temp = '';
      //  }
     }

     else if(checkOperand(btn)){
       if(btn == '='){
         //save 2nd number, calculate result and add to the string
         no2 = temp;
         temp = '';
         input = calculate(no1, no2, operand).toString();
         listUser.add(User(double.parse(no1), double.parse(no2), double.parse(input)));
       }
       else{
         //save 1st number to no1, reset the string and add save operand for calculate when user press '='
         no1 = temp;
         temp = '';
         input = btn;
         operand = btn;
       }       
     }

     else if(checkNumber(btn)){
       //add number to temp and update input 
       temp += btn;
       input = temp;
     }     
    });
  }
  @override
  Widget build(BuildContext context) { 
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (BuildContext context, int index){
        if(index == 0){
          //display result
          return Container(
            height: 208.0,
            alignment: Alignment.bottomRight,
            child: Text(input, style: TextStyle(fontSize: 30.0),),
          );
        }
        //index - 1 to skill the row of result
        int i = index - 1;
        return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Expanded(        
          child: Container(
            width: 70.0,
            height: 70.0,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[4 * i], style: TextStyle(fontSize: 30.0),),
              onPressed: (){
                 debugPrint('${listButton[4 * i]}');
                implementButton(listButton[4 * i]);
              },
            ),
          ),
        ),
        Expanded(        
          child: Container(
            width: 70.0,
            height: 70.0,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[4 * i + 1], style: TextStyle(fontSize: 30.0),),
              onPressed: (){
                 debugPrint('${listButton[4 * i + 1]}');
                implementButton(listButton[4 * i + 1]);
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 70.0,
            height: 70.0,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[4 * i + 2], style: TextStyle(fontSize: 30.0),),
              onPressed: (){
                debugPrint('${listButton[4 * i + 2]}');
               implementButton(listButton[4 * i + 2]);
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 70.0,
            height: 70.0,
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.red,
              child: Text(listButton[4 * i + 3], style: TextStyle(fontSize: 30.0),),
              onPressed: (){
                debugPrint('${listButton[4 * i + 3]}');
                implementButton(listButton[4 * i + 3] );
              },
            ),
          ),
        ),
      ],
    );
      },
    );
  }
}
