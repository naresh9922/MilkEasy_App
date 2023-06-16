import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetFeedback extends StatefulWidget {
  const GetFeedback({super.key});

  @override
  State<GetFeedback> createState() => _GetFeedbackState();
}

class _GetFeedbackState extends State<GetFeedback> {
  String strRes = "";
  Map? mapRes;
  Map? dataRes;
  List listRes = [];

  Future apicall() async {
    http.Response response;
    response = await http.post(Uri.parse("http://127.0.0.1:2000/feedback/get"));
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedbacks"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 16.0,
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Mobile')),
            DataColumn(label: Text('Feedback')),
          ],
          rows: List<DataRow>.generate(
            listRes.length,
            (index) => DataRow(
              cells: [
                DataCell(Text('${index + 1}')),
                DataCell(Text(listRes[index]['name'].toString())),
                DataCell(Text(listRes[index]['mo_no'].toString())),
                DataCell(Container(
                    width: double.infinity,
                    child: Text(listRes[index]['feedback'].toString()))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
