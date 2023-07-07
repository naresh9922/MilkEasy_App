import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FarmerMilkCollection extends StatefulWidget {
  final String data;

  const FarmerMilkCollection({super.key, required this.data});

  @override
  State<FarmerMilkCollection> createState() => _FarmerMilkCollectionState();
}

class _FarmerMilkCollectionState extends State<FarmerMilkCollection> {
  String strRes = "";
  Map? mapRes;
  Map? dataRes;
  late String email;
  List listRes = [];

  Future apicall() async {
    http.Response response;
    email = widget.data;
    response = await http
        //     .post(Uri.parse("http://192.168.137.97:2000/milk/getcollection"));
        .post(Uri.parse(
            "http://192.168.1.7:2000/milk/FarmerMilkcollection/$email"));
    if (response.statusCode == 200) {
      if (mounted) {
        setState(() {
          // strRes = response.body;
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
        title: Text("Milk Collection Data"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
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
