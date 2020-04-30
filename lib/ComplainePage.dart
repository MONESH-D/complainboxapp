import 'package:complainbox/NewsUpdates.dart';
import 'package:complainbox/complainarea.dart';

import 'package:flutter/material.dart';
class ComplainPage extends StatefulWidget {
  @override
  _ComplainPageState createState() => _ComplainPageState();
}

class _ComplainPageState extends State<ComplainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.teal[400],
      title: Text('Complain Page'),),
      body: Column(children: <Widget>[
        ComplainArea(),
        NewsStream()
        
      ],)
      );
  }
}

