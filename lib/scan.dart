import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int i = 1;
  String barcode = "";
  final DBRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(41, 188, 233, 100),
          title: Text('QR Code Scanner'),
        ),
        body: Container(
          color: Color.fromRGBO(173, 216, 230, 200),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Scan'),
                    onPressed: () async {
                      try {
                        String barcode = await BarcodeScanner.scan();
                        setState(() {
                          this.barcode = barcode;
                        });
                      } on PlatformException catch (error) {
                        if (error.code == BarcodeScanner.CameraAccessDenied) {
                          setState(() {
                            this.barcode =
                                'Izin kamera tidak diizinkan oleh pengguna';
                          });
                        } else {
                          setState(() {
                            this.barcode = 'Error: $error';
                          });
                        }
                      }
                    },
                  ),
                  Text(
                    'Result: $barcode',
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(230.0, 380.0, 8.0, 1.0),
                          child: Column(
                            children: <Widget>[
                              FloatingActionButton.extended(
                                backgroundColor:
                                    Color.fromRGBO(41, 188, 233, 100),
                                foregroundColor: Colors.black,
                                onPressed: () {
                                  writeData();
                                  i++; // Respond to button press
                                },
                                icon: Icon(Icons.add),
                                label: Text('SAVE'),
                              )
                              // RaisedButton(
                              //   child: Text('Write'),
                              //   onPressed: () {
                              //     writeData();
                              //     i++;
                              //   },
                              // )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void writeData() {
    DBRef.child("$i").set({
      'id': 'ID$i',
      'data': '$barcode',
      'timestamp': ServerValue.timestamp,
    });
  }
}
