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
  getData()async{
    var response =await get(Uri.parse("https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/"),
      headers:{
      "Authorization":"token"
        },
    );
    if(response.statusCode==200){
      var data=jsonDecode(response.body);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.more_horiz),
        title: Text("Lead List"),
        actions: [ Icon(Icons.notifications)],

      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          return ListView.builder(
          itemCount: snapshot.data["data"].length,
          itemBuilder: (context,index) {
          return
          ListTile(
          leading: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle
          ),
            child: Text(snapshot.data[index]["leads"]["id"]),

          ),
          title: Text(snapshot.data[index]["leads"]["name"]),
          subtitle: Text(snapshot.data[index]["leads"]["email"]),
          trailing: Container(
          height: 30,
          width: 70,
          decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)
          ),
          child: Text("Flutter"),
          ),
          );

          },
          );

        },
      ),
    );
  }
}
