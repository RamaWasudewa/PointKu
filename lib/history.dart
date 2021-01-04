import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(new History());
}

class History extends StatelessWidget {
  final DBRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'History',
      home: Scaffold(
        appBar: AppBar(
          title: Text('History'),
        ),
        body: Row(
          children: <Widget>[
            RaisedButton(
              child: Text('Read'),
              onPressed: () {
                readData();
              },
            ),
            Row(
              children: [Text('')],
            )
          ],
        ),
      ),
    );
  }

  void writeData() {
    DBRef.child("1").set({
      'id': 'ID1',
      'data': 'Sample',
    });
  }

  void readData() {
    DBRef.once().then((DataSnapshot dataSnapShot) {
      print(dataSnapShot.value);
    });
  }
}
