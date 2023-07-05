import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class farmer_list extends StatefulWidget {
  const farmer_list();

  @override
  State<farmer_list> createState() => _farmer_listState();
}

class _farmer_listState extends State<farmer_list> {
  String strRes = "";
  Map? mapRes;
  Map? dataRes;
  List listRes = [];

  Future apicall() async {
    http.Response response;
    response =
        await http.post(Uri.parse("http://192.168.1.7:2000/user/fetchFarmers"));
    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          mapRes = json.decode(response.body);
          listRes = mapRes!['data'];
        });
      }
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farmer list"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
