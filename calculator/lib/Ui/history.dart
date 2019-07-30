import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History'),),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index){
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('Id'),
                Text('Description'),
                Text('Date'),
                Text('Delete'),
              ],
            );        
        },
      ),
    );
  }
}

