import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


class UserProvider extends  ChangeNotifier{
  Future getData() async {

    Response response = await get(
        Uri.parse("https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/"),
        headers: {
          "Authorization":"Token 92027d4c10d246c44007206174c01871582161e3"
        }
    );
    print(response.body);
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    }catch (error) {
      print("Error during API call: $error");
      throw Exception("Failed to load data. Check your internet connection.");
    }
    notifyListeners();
  }

}