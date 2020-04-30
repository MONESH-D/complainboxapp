import 'package:complainbox/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _Firestore = Firestore.instance;
String complainText;
String location;
String department;
final complainTextController = TextEditingController();
final locationTextController = TextEditingController();
final departmentTextController = TextEditingController();
class ComplainArea extends StatefulWidget {
  @override
  _ComplainAreaState createState() => _ComplainAreaState();
}

class _ComplainAreaState extends State<ComplainArea> {
  final _formkey = GlobalKey<FormState>();
 Widget ComplainArea(){
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Colors.white,
        elevation: 10.0,
              child: Container(
                margin: EdgeInsets.all(10.0),
               
                child: Form(
                  key: _formkey,
                                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
             
                    children: <Widget>[
          Center(child: TextFormField(
            maxLength: 50,
          decoration: KTextFieldDecoration.copyWith(hintText: 'Enter your Complain',),
            textAlign: TextAlign.center,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Please write your complain';
              }
              return null;
            },
            controller: complainTextController,
            onChanged: (value){
                complainText = value;
            },

          )),
            Center(
              
              child: TextFormField(
                   maxLength: 50,
              decoration: KTextFieldDecoration.copyWith(  hintText: 'location (example: 1stMain street/Annanagar/chennai/Tamilnadu)',),
              
              textAlign: TextAlign.center,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Please enter your location';
                }
                return null;
              },
              controller: locationTextController,
            onChanged: (value){
              location = value;
            },)
            
            ,),
            Center(child: TextFormField(
                 maxLength: 50,
              decoration: KTextFieldDecoration.copyWith(   hintText: 'Enter the department',),
              textAlign: TextAlign.center,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Department is required';
                }
                return null;
              },
              controller: departmentTextController,
            onChanged: (value){
              department = value;
            },)
            ,),Container(

            child: Center(
  
              child: FlatButton(
                color: Colors.teal,
                onPressed: (){
                  if (_formkey.currentState.validate()){
                  complainTextController.clear();
                  locationTextController.clear();
                  departmentTextController.clear();
                  _Firestore.collection('complains').add({
                      'complain' : complainText,
                      'location' : location,
                      'department' : department,

                  });
                  }
                },
                
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('Submit'),Icon(Icons.add_box),
                    ],
                  ),
                ),
              ),
            ),
          )

         
        ],
        ),
                ),),
      ),
    
    );
    } 
  
  @override
  Widget build(BuildContext context) {
    return 
      ComplainArea();
  }
}


