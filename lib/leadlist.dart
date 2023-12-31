

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login/providers/userprovider.dart';
import 'package:provider/provider.dart';

class LeadList extends StatelessWidget {
  const LeadList({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context,listen: false).getData();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.more_horiz),
        title: Text("Lead List"),
        actions: [Icon(Icons.notifications)],
      ),
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context,listen: false).getData(),
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
