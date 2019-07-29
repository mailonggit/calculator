//s1: import 
import 'dart:async';
import 'user.dart';

class UserBloc{
  //create list of data
  List<User> listUser = [];

  //stream controller: list, result
  final listStreamController = StreamController<List<User>>();

  final resultStreamController = StreamController<User>();

  final no1StreamController = StreamController<User>();

  final no2StreamController = StreamController<User>();

  //get stream and sink
  Stream<List<User>> get listStream => listStreamController.stream;

  StreamSink<List<User>> get listSink => listStreamController.sink;

  StreamSink<User> get resultSink => resultStreamController.sink;

  StreamSink<User> get no1Sink => no1StreamController.sink;

  StreamSink<User> get no2Sink => no2StreamController.sink;

  //constructor to add data and listen for change
  UserBloc(){
    listStreamController.add(listUser);
    no1StreamController.stream.listen(analyzeData);
    no2StreamController.stream.listen(analyzeData);
    resultStreamController.stream.listen(analyzeResult);
  }
  //core function
  analyzeData(User user){

  }
  analyzeResult(User user){

  }

  //dispose
  dispose(){
    listStreamController.close();
    no1StreamController.close();
    no2StreamController.close();
    resultStreamController.close();
  }
}