import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login/leadlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
int id=0;
  Future loginScreen({required username,required password,required BuildContext context})async{
    var data={
     "username":username,
      "password":password,
    };
    var response = await post(
      Uri.parse("https://crm-beta-api.vozlead.in/api/v2/account/login/"),
      body: data,

    );

    print("<<<<<<<<<<<<<<${response.body}");

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print(response.body);
      if (result["data"] == null) {
        Fluttertoast.showToast(msg: "Please register");
      } else {
        id = int.parse(result["data"]["token"]);
        userCredential();
        Fluttertoast.showToast(msg: "Welcome");
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=> const LeadList()));
      }
    }
  }
  userCredential()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.getString("token");
  }
  TextEditingController usernamcontroller =TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/3d-internet-secuirty-badge_1048-18106.jpg?size=338&ext=jpg&ga=GA1.1.1546980028.1703721600&semt=sph"),
                        fit: BoxFit.fill)),
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
                  controller: usernamcontroller,
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
                        loginScreen(username: usernamcontroller.text,password: passwordcontroller.text,context: context);},
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
