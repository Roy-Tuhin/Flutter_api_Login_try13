import 'package:flutter/material.dart';
import 'package:try13/main.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
