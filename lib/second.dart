import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:try13/ApiResponse.dart';
import 'package:try13/main.dart';
import 'main.dart';

class Second extends StatefulWidget {
  final ApiResponse response;
  const Second({required this.response});


  @override
  _SecondState createState() => _SecondState(this.response);
}

class _SecondState extends State<Second> {
  var responseRef;

  _SecondState(this.responseRef);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("Status: ${widget.response.status}"),
               Text("Message: ${widget.response.message}"),
              Text("Welcome"),
              SizedBox(height: 50,),

              OutlinedButton.icon(onPressed: (){Navigator.pop(context, MaterialPageRoute(builder: (context)=> MyApp()));}, icon: Icon(Icons.exit_to_app,size :18,), label: Text("Logout")),

            ],
          ),
        ),
      ),
    );
  }
}
