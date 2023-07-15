import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FarmerMilkCollection extends StatefulWidget {
  final String data;
  final String name;
  const FarmerMilkCollection(
      {super.key, required this.data, required this.name});

  @override
  State<FarmerMilkCollection> createState() => _FarmerMilkCollectionState();
}

class _FarmerMilkCollectionState extends State<FarmerMilkCollection> {
  String strRes = "";
  Map? mapRes;
  Map? dataRes;
  late String email;
  late String name;
  List listRes = [];

  Future apicall() async {
    http.Response response;
    email = widget.data;
    response = await http.post(Uri.parse(
        "http://192.168.174.222:2000/milk/FarmerMilkcollection/$name"));
    // Uri.parse("http://192.168.1.7:2000/milk/FarmerMilkcollection/$name"));
    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          // strRes = response.body;
          mapRes = json.decode(response.body);
          listRes = mapRes!['data'];
        });
      }
    } else {
      print("API call failed with status code: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    name = widget.name;
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Milk Collection Data"),
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text("Hi $name"),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Collector Name')),
              DataColumn(label: Text('Shift')),
              DataColumn(label: Text('Fat')),
              DataColumn(label: Text('Qty')),
              DataColumn(label: Text('Date')),
            ],
            rows: List<DataRow>.generate(
              listRes.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text('${index + 1}')),
                  DataCell(Text(listRes[index]['Collector_name'].toString())),
                  DataCell(Text(listRes[index]['shift'].toString())),
                  DataCell(Text(listRes[index]['fat'].toString())),
                  DataCell(Text(listRes[index]['qty'].toString())),
                  DataCell(Text(listRes[index]['createdOn'].toString())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
