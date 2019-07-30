// double calculateResult(String operand){
//     if(operand == '+'){
//       return _no1 + _no2;
//     }
//     else if(operand == '-'){
//       return _no1 - _no2;
//     }
//     else if(operand == 'X'){
//       return _no1 * _no2;
//     }
//     else if(operand == '/'){
//       return _no1 / _no2;
//     }
//     else if(operand == '%'){
//       return _no1 % _no2;
//     }
//   }
  checkOperand(String input){
    if(input == '+' || input == '-' || input == 'X' || input == '/' || input == '%' || input == '='){
      return true;
    }
    return false;
  }
  checkNumber(String input){
    if(double.parse(input) > 1 || double.parse(input) < 9){
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