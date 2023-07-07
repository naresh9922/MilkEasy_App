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
    response =
        // await http.post(Uri.parse("http://192.168.137.97:2000/feedback/get"));
        await http.post(Uri.parse("http://192.168.1.7:2000/feedback/get"));
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
      // body: SizedBox(
      //   height: 300,
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: GridView.count(
      //       crossAxisCount: 2,
      //       children: [
      //         DataTable(
      //           columnSpacing: 16.0,
      //           columns: [
      //             DataColumn(label: Text('ID')),
      //             DataColumn(label: Text('Name')),
      //             DataColumn(label: Text('Mobile')),
      //             DataColumn(label: Text('Feedback')),
      //           ],
      //           rows: List<DataRow>.generate(
      //             listRes.length,
      //             (index) => DataRow(
      //               cells: [
      //                 DataCell(Text('${index + 1}')),
      //                 DataCell(Text(listRes[index]['name'].toString())),
      //                 DataCell(Text(listRes[index]['mo_no'].toString())),
      //                 DataCell(Container(
      //                     width: double.infinity,
      //                     child: Text(listRes[index]['feedback'].toString()))),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                    child: Text(listRes[index]['feedback'].toString()),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
