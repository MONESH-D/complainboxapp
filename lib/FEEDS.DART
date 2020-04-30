
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final _Firestore = Firestore.instance;
class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
      title: Text('complains')
    ),
    body: SafeArea(
          child: Column(
        children: <Widget>[ComplainStream()]),
    ),
    );
  }
}

class ComplainStream extends StatelessWidget{
 @override
 Widget build(BuildContext context){
   return StreamBuilder<QuerySnapshot>(
     stream: _Firestore.collection('complains').snapshots(),
     builder: (context, snapshot){
       if (!snapshot.hasData){
         return Center(child: CircularProgressIndicator(backgroundColor: Colors.teal),);}
         final complains = snapshot.data.documents;
         List<ComplainsUpdate> complainUpdates = [];
         for (var complain in complains){
           final dcomplain = complain.data['complain'];
           final dlocation = complain.data['location'];
           final ddepartment = complain.data['department'];
           final complainUpdated =  ComplainsUpdate(complain: dcomplain,location: dlocation,department: ddepartment,);
  complainUpdates.add(complainUpdated);  
        }
       return Expanded(
                child: ListView(
           children: 
             complainUpdates,
           ),
       );
     
         
              
       }
      );   }

 }





class ComplainsUpdate extends StatelessWidget {
  ComplainsUpdate({this.complain,this.location,this.date,this.department});
  final String complain;
  final String location;
  final String department;
  final String date; 
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 20.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(child: Text(complain,)),
            SizedBox(height: 20.0,),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(location,),
              ],),
            ),
            SizedBox(height: 20.0,),
            Column(
              children: <Widget>[
                
                   Text('Department: $department',),
                  
                
              ],
            ),
        ],
         
        )
      ,),)
      );
  }
}

