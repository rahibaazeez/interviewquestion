import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login/leadlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'demo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? id;
  Future loginScreen({required username,required password})async{
    var data={
      "username":username,
      "password":password,
    };
    try {
      var response = await post(
        Uri.parse("https://crm-beta-api.vozlead.in/api/v2/account/login/"),
        body: data,
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(response.body);
        if (result["data"] == null) {
          Fluttertoast.showToast(msg: "Please register");
        } else {
          print("Token value: ${result["data"]["token"]}");
          userCredential();
          Fluttertoast.showToast(msg: "Welcome");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LeadList()));
        }
      }
    }catch (error) {
      print("Error during login: $error");
      Fluttertoast.showToast(msg: "Failed to login. Please try again.");
    }
  }
  userCredential()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString("token", id.toString());
    sharedPreferences.getString("token");
  }
  TextEditingController usernamecontroller =TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                height: 300,
                width: 400,

               ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120),
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.blue, fontSize: 35),
                ),
              ),
              Text("Welcome back ! Please enter your credentials to login"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                      label: Text("User name"), border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      label: Text("Password"), border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: Row(
                  children: [
                    Text("Forgot your"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Password?",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 350,

                  child: ElevatedButton(
                      onPressed: (){
                        print("fhghjh");
                        loginScreen(username: usernamecontroller.text,password: passwordcontroller.text);},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        side: BorderSide.none,
                      ),
                      child: Text("Sign In",style: TextStyle(color: Colors.white),))),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  children: [ Text("Don't have any account?"),
                    TextButton(onPressed: (){}, child: Text("Sign Up",style: TextStyle(color: Colors.blue),))],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
