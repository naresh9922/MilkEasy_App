import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MilkCollectionList extends StatefulWidget {
  const MilkCollectionList({super.key});

  @override
  State<MilkCollectionList> createState() => _MilkCollectionListState();
}

class _MilkCollectionListState extends State<MilkCollectionList> {
  String strRes = "";
  Map? mapRes;
  Map? dataRes;
  List listRes = [];

  Future apicall() async {
    http.Response response;
    response = await http
        .post(Uri.parse("http://192.168.1.7:2000/milk/getcollection"));
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
    print(listRes.runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text("Milk Collection Data"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Farmer Name')),
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
                DataCell(Text(listRes[index]['Farmer_name'].toString())),
                DataCell(Text(listRes[index]['shift'].toString())),
                DataCell(Text(listRes[index]['fat'].toString())),
                DataCell(Text(listRes[index]['qty'].toString())),
                DataCell(Text(listRes[index]['createdOn'].toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
