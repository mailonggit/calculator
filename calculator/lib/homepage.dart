import 'package:calculator/checklegit.dart';
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
  List<String> button = [
    'AC','Del','%','/',
    '7','8','9','X',
    '4','5','6','-',
    '1','2','3','+',
    '','0','.','=',
  ];
  String input = '0';
  String no1, no2, result;
  String temp = '', operand;
  User user;
  implementButton(String btn){
    setState(() {
     debugPrint('Tapped');
     if(checkCommand(btn)){
       if(btn == 'AC'){
         input = '0';
         temp = '';
       }
       else if(btn == 'x'){
         int length = temp.length;
         input = temp.substring(1, length - 1);
         debugPrint(input);
         temp = '';
       }
     }
     else if(checkOperand(btn)){
       if(btn == '='){
         //save 2nd number, calculate result and add to the string
         no2 = temp;
         temp = '';
         input = calculate(no1, no2, operand).toString();
       }
       else{
         //save 1st number to no1, reset the string and add save operand for calculate when user press '='
         no1 = temp;
         user.no1 = double.parse(no1);
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
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      children: List.generate(24, (index) {
        if (index < 4) {
          index == 3 ? result = input : result = '';
          return Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.bottomRight,
            child: Text(
              result,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(
                color: Colors.blue,
                width: 3.0,
              ),
              bottom: BorderSide(
                color: Colors.blue,
                width: 3.0,
              ),
            )),
          );
        }
        return Container(
          child: RaisedButton(
            child: Text(
              button[index - 4],
              style: TextStyle(fontSize: 30.0),
            ),
            color: Colors.white,
            onPressed: () {
             implementButton(button[index-4]);                
            },
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        );
      }),
    );
  }
}
