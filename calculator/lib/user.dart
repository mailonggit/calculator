class User{
  double _no1, _no2, _result;
  int _id;

  User(this._id, this._no1, this._no2, this._result);

  int get id => _id;

  double get no1 => _no1;

  double get no2 => _no2;

  double get result => _result;

  set no1(double no1) => _no1 = no1;
  
  set no2(double no2) => _no2 = no2;

  set result(double result) => _result = result;

}