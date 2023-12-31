import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../leadlist.dart';

class LoginProvider extends ChangeNotifier{
  String? id;
  Future loginScreen({required username,required password,required BuildContext context})async{
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
        if (result["data"] == null) {
          Fluttertoast.showToast(msg: "Please register");
        } else {
          userCredential();
          Fluttertoast.showToast(msg: "Welcome");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LeadList()));
        }
      }
    }catch (error) {
      Fluttertoast.showToast(msg: "Failed to login. Please try again.");
    }
    notifyListeners();
  }
  userCredential()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString("token", id.toString());
    sharedPreferences.getString("token");
    notifyListeners();
  }
  TextEditingController usernamecontroller =TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();


}