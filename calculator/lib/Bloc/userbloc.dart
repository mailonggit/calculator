//s1: import 
import 'dart:async';
import 'package:calculator/Models/user.dart';
import 'package:calculator/Sqlite/database.dart';


class UserBloc{
  UserBloc({getListUser()});

  final _userController = StreamController<List<User>>.broadcast();

  Stream get listUser => _userController.stream;

  dispose(){
    _userController.close();
  }

  getListUser() async{
    _userController.sink.add(await DBProvider.db.getListUser());
  }
  //feature
  deleteUser(int id){
    DBProvider.db.deleteUser(id);
    getListUser();
  }

  addUser(User user){
    DBProvider.db.createUser(user);
    getListUser();
  }
 
}