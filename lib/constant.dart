import 'package:flutter/material.dart';

const KTextFieldDecoration = InputDecoration(
                hintText: 'Enter a value',
                hintStyle: TextStyle(fontSize: 10.0),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.tealAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              );