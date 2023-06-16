import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  String strRes = "";
  Map? mapRes;
  Map? dataRes;
  List listRes = [];

  Future apicall() async {
    http.Response response;
    response =
        await http.post(Uri.parse("http://127.0.0.1:2000/user/fetchCollector"));
    if (response.statusCode == 200) {
      setState(() {
        // strRes = response.body;
        mapRes = json.decode(response.body);
        listRes = mapRes!['data'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(listRes.runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text("user list"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('User')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Mobile')),
            DataColumn(label: Text('UPI ID')),
            DataColumn(label: Text('Address')),
            // DataColumn(label: Text('ID')),
          ],
          rows: List<DataRow>.generate(
            listRes.length,
            (index) => DataRow(
              cells: [
                DataCell(Text('${index + 1}')),
                DataCell(Text(listRes[index]['usertype'].toString())),
                DataCell(Text(listRes[index]['name'].toString())),
                DataCell(Text(listRes[index]['email'].toString())),
                DataCell(Text(listRes[index]['mobile'].toString())),
                DataCell(Text(listRes[index]['upiid'].toString())),
                DataCell(Text(listRes[index]['address'].toString())),
                // DataCell(Text(listRes[index]['_id'].toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
