import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login/leadlist.dart';
import 'package:login/providers/loginprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'demo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProvider>(context,listen: false).userCredential();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key:  Provider.of<LoginProvider>(context,listen: false).formkey,
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
                  controller:  Provider.of<LoginProvider>(context,listen: false).usernamecontroller,
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
                  controller:  Provider.of<LoginProvider>(context,listen: false).passwordcontroller,
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
                        Provider.of<LoginProvider>(context,listen: false).loginScreen(username:  Provider.of<LoginProvider>(context,listen: false).usernamecontroller.text,password:  Provider.of<LoginProvider>(context,listen: false).passwordcontroller.text,context:context );},
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
