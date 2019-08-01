  import 'package:flutter/rendering.dart';

checkOperand(String input){
    if(input == '+' || input == '-' || input == 'X' || input == '/' || input == '%' || input == '='){
      return true;
    }
    return false;
  }
  int count = 0;
  checkNumber(String input){
    if(input == '.'){      
      count++;
      debugPrint('count: $count');
    }
    if(count > 1){
      return false;
    }
    if(double.parse(input) > 1 || double.parse(input) < 9 || input == '.'){
      return true;
    }
    
    return false;
  }
  checkCommand(String input){
    if(input == 'AC' || input == 'x'){
      return true;
    }
    return false;
  }
  double calculate(String n1, String n2, String operand){
    double no1 = double.parse(n1);
    double no2 = double.parse(n2);
    if(operand == '+'){
      return no1 + no2;
    }
    else if(operand == '-'){
      return no1 - no2;
    }
    else if(operand == 'X'){
      return no1 * no2;
    }
    else if(operand == '/'){
      return no1 / no2;
    }
      return no1 % no2;
  }