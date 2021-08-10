import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:try13/ApiResponse.dart';
import 'package:try13/second.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailController = TextEditingController();
  var passwordontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller:
                    emailController, //==========================================
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller:
                    passwordontroller, //=========================================
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.password)),
              ),
              SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                   login() ;
                  },
                  icon: Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: Text("Login"),
                  
                  ),
               
            ],
          ),
        )),
      ),
    );
  }

  // CREATING FUNCTION TO CALL LOGIN API
  Future<void> login() async {
    var jsonResponse = null;
    if (passwordontroller.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(Uri.parse("http://medbo.digitalicon.in/api/medboapi/login"),
          body: ({
            'LoginId': emailController.text,
            'Password': passwordontroller.text
          }));
      if (response.statusCode == 200) {
        print("Correct");
        print(response.body);
        jsonResponse = json.decode(response.body.toString());
        print(jsonResponse);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Second(response: ApiResponse.fromJson(response.data)));
      } else {
        print("Wronggooooooooooooooooooooooooooo");
        print(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank field is not allowed")));
    }
  }




  
}
