//s1: import 
import 'dart:async';
import 'package:calculator/Models/user.dart';
import 'package:calculator/Sqlite/database.dart';


class UserBloc{

  final _userController = StreamController<List<User>>.broadcast();

  get listUser => _userController.stream;

  dispose(){
    _userController.close();
  }

  getListUser() async{
    _userController.sink.add(await DBProvider.db.getAllUsers());
  }

  UserBloc(){
    getListUser();
  }
  //feature
  deleteUser(int id){
    DBProvider.db.deleteUser(id);
    getListUser();//update list after deleting
  }
  deleteList(){
    DBProvider.db.deleteAll();
    getListUser();
  }
  addUser(User user){
    DBProvider.db.newUser(user);
    getListUser();//update list after inserting
  }
 
}