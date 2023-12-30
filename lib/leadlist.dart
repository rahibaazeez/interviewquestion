

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LeadList extends StatefulWidget {
  const LeadList({super.key});

  @override
  State<LeadList> createState() => _LeadListState();
}

class _LeadListState extends State<LeadList> {
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
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.more_horiz),
        title: Text("Lead List"),
        actions: [Icon(Icons.notifications)],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: snapshot.data["data"]["leads"].length,
            itemBuilder: (context, index) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.hasData){
                print(snapshot);
                return ListTile(
                  leading: Container(
                    height: 80,
                    width: 80,
                    decoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                    child: Center(child: Text(snapshot.data["data"]["leads"][index]["id"].toString())),
                  ),
                  title: Text(snapshot.data["data"]["leads"][index]["name"]),
                  subtitle: Text(snapshot.data["data"]["leads"][index]["email"]),
                  trailing: Container(
                    height: 30,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Flutter")),
                  ),
                );
              }else{
                return Text("error");
              }
            },
          );
        },
      ),
    );
  }
}
