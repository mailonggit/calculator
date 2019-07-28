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

class BodyPage extends StatelessWidget {
  List<String> button = [
    'AC',
    'x',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '',
    '0',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      children: List.generate(24, (index) {
        String result = '';
        if (index < 4) {
          index == 3 ? result = '0' : result = '';
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
            onPressed: () {},
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
