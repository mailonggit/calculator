import 'package:calculator/Bloc/userbloc.dart';
import 'package:calculator/Models/user.dart';
import 'package:calculator/Sqlite/database.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    final height = 40.0;
    final width = 50.0;
    final style = TextStyle(fontSize: 15.0);
    final rightBorder = BorderSide(width: 2.0);
    final bottomBorder = BorderSide(width: 2.0);
    //var bloc = UserBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: FutureBuilder<List<User>>(
          future: DBProvider.db.getAllUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Row(
                      children: <Widget>[
                        Container(
                          width: width,
                          height: height,
                          child: Center(child: Text('Id', style: style)),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border(
                              bottom: rightBorder,
                              right: bottomBorder,
                            
                            ),
                          ),
                        ),
                        Container(
                          width: width * 2,
                          height: height,
                          child: Center(child: Text('Description', style: style)),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border(
                             bottom: rightBorder,
                              right: bottomBorder,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 3,
                          height: height,
                          child: Center(child: Text('Time', style: style)),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border(
                               bottom: rightBorder,
                              right: bottomBorder,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: width,
                            height: height,
                            child: Center(child: Text('Delete', style: style)),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border(
                                 bottom: rightBorder,
                              right: bottomBorder,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  User user = snapshot.data[index - 1];
                  return Row(                  
                    children: <Widget>[
                        Container(
                          width: width,
                          height: height,
                          child: Center(child: Text(user.id.toString(), style: style)),
                          decoration: BoxDecoration(
                            border: Border(
                               bottom: rightBorder,
                              right: bottomBorder,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 2,
                          height: height,
                          child: Center(child: Text(user.description, style: style)),
                          decoration: BoxDecoration(
                            border: Border(
                               bottom: rightBorder,
                              right: bottomBorder,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 3,
                          height: height,
                          child: Center(child: Text(user.date, style: style)),
                          decoration: BoxDecoration(
                            border: Border(
                               bottom: rightBorder,
                              right: bottomBorder,
                            ),
                          ),
                        ),
                      Expanded(
                          child: Container(
                          width: width,
                          height: height,                        
                              child: FlatButton(
                              child: Text('x', style: style),                              
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  DBProvider.db.deleteUser(user.id);
                                });
                              },                              
                          ),                          
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: rightBorder,
                              right: bottomBorder,
                              ),
                            ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
