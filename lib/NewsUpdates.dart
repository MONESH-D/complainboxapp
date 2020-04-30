import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:ffi';
import 'dart:async';
final _Firestore = Firestore.instance;

class NewsUpdates extends StatefulWidget {
  @override
  _NewsUpdatesState createState() => _NewsUpdatesState();
}

class _NewsUpdatesState extends State<NewsUpdates> {


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10.0),
    child: Material(
      elevation: 10.0,
      child: NewsStream()
      
      ),
      );

    
  }
}

class NewsStream extends StatelessWidget{
 @override
 Widget build(BuildContext context){
   return StreamBuilder<QuerySnapshot>(
     stream: _Firestore.collection('newsupdates').snapshots(),
     builder: (context, snapshot){
       if (!snapshot.hasData){
         return Center(child: CircularProgressIndicator(backgroundColor: Colors.teal),);}
         final newsupdates = snapshot.data.documents;
         List<NewsUpdate> newsUpdates = [];
         for (var news in newsupdates){
           final dheading = news.data['heading'];
           final dnews = news.data['news'];
           
           final newsUpdated =  NewsUpdate(heading: dheading, news: dnews);
  newsUpdates.add(newsUpdated);  
        }
       return Expanded(
                child: ListView(
           children: 
             newsUpdates,
           ),
       );
              
       }
      );   }

 }

 class NewsUpdate extends StatelessWidget {
  NewsUpdate({this.news,this.heading});
  final String news;
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20.0),
      child: Material(
        elevation: 20.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(child: Text(heading,style: TextStyle(fontSize: 20.0),)),
                SizedBox(height: 20.0,),       
            ],
             
            ),
            Column(children: <Widget>[
              Text(news)
            ],)

          ],
        ),
      ),)
      );
  }
}
