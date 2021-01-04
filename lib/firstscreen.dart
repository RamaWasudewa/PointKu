import 'package:flutter/material.dart';
import 'package:link/link.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pointku/history.dart';
import 'package:pointku/profile.dart';
import 'scan.dart';
import 'profile.dart';

import 'package:firebase_database/firebase_database.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PointKu',
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  BuildContext get context => null;
  final DBRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 188, 233, 100),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage("assets/Logo_Pointku.png"),
            height: 5.0,
            width: 5.0,
          ),
        ),
        title: Center(
          child: Text(
            'PointKu',
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              icon: new Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          )
        ],
      ),
      body: Container(
        color: Color.fromRGBO(173, 216, 230, 200),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: new Card(
                  color: Colors.lightBlue[50],
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Total SKP',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 27),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            new Text(
                              '50/100',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      new LinearPercentIndicator(
                                        width: 200.0,
                                        lineHeight: 14.0,
                                        percent: 0.5,
                                        center: Text(
                                          "50 Point",
                                          style: new TextStyle(fontSize: 12.0),
                                        ),
                                        leading:
                                            Icon(Icons.control_point_duplicate),
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        backgroundColor: Colors.grey,
                                        progressColor: Colors.blue,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => MyApp()),
                                          );
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0),
                                                child: Image(
                                                  image: AssetImage(
                                                      "assets/qr_code.png"),
                                                  height: 50.0,
                                                  width: 50.0,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30.0),
                                                    child: Text(
                                                      "Scan",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            textColor: Colors.grey,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => History()),
                              );
                            },
                            child: const Text('Tap for History'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Featured Event",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 0.0),
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.asset(
                                  'assets/integer.jpg',
                                  height: 50,
                                ),
                                title: const Text(
                                  'INTEGER #2',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                subtitle: Text(
                                  'Acara Ulang Tahun Jurusan Teknik Informatika',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 5.0, 16.0, 0.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: Colors.grey,
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: Link(
                                      url:
                                          'https://www.instagram.com/integer.hmjtiundiksha/',
                                      child: Text('Tap for Detail'),
                                      onError: _showErrorSnackBar,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 5.0),
                  child: Column(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image.asset(
                                  'assets/tweak.jpg',
                                  height: 50,
                                ),
                                title: const Text(
                                  'TWEAK #',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                subtitle: Text(
                                  'Acara Ulang Tahun Fakultas Teknik dan Kejuruan',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  FlatButton(
                                    textColor: Colors.grey,
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: Link(
                                      url:
                                          'https://www.instagram.com/tweakbemftk/',
                                      child: Text('Tap for Detail'),
                                      onError: _showErrorSnackBar,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorSnackBar() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }

  void readData() {
    DBRef.once().then((DataSnapshot dataSnapShot) {
      print(dataSnapShot.value);
    });
  }
}
