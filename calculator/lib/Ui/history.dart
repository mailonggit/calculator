import 'package:calculator/Bloc/userbloc.dart';
import 'package:calculator/Models/user.dart';
import 'package:calculator/Sqlite/database.dart';
import 'package:flutter/material.dart';
class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final bloc = UserBloc();
  final height = 40.0;
  final width = 50.0;
  final style = TextStyle(fontSize: 15.0);
  final rightBorder = BorderSide(width: 2.0);
  final bottomBorder = BorderSide(width: 2.0);
  @override
  void dispose() {
    super.dispose();
    //bloc.dispose();
  }

  _showDialog(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text('Do you really want to delete this list?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),       
              onPressed: (){
                setState(() {
                    bloc.deleteList();
                    Navigator.of(context).pop();
                });        
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );        
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            splashColor: Colors.red,
            onPressed: _showDialog,
          ),
        ],
      ),
      body: StreamBuilder<List<User>>(
          stream:  bloc.listUser,//bloc.listUser,
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
                          child:
                              Center(child: Text('Description', style: style)),
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
                        child: Center(
                            child: Text(user.id.toString(), style: style)),
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
                        child:
                            Center(child: Text(user.description, style: style)),
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
                                debugPrint('Deleted');
                                bloc.deleteUser(user.id);                                
                                //DBProvider.db.deleteUser(user.id);
                                // for (int i = 0; i < snapshot.data.length; ++i) {
                                //   snapshot.data[i].id = i + 1;
                                // }
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
