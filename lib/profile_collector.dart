import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class profile extends StatefulWidget {
  final String data;
  const profile({super.key, required this.data});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String strRes = "";
  Map? mapRes;
  Map? dataRes;
  List listRes = [];
  late String mailId;
  bool isLoading = true;

  Future apicall() async {
    http.Response response;
    mailId = widget.data;

    response = await http
        .post(Uri.parse("${dotenv.env['link']}user/fetchProfile/$mailId"));
    if (response.statusCode == 200) {
      setState(() {
        mapRes = json.decode(response.body);
        listRes = mapRes!['data'];
        print(listRes[0]['name']);
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
    mailId = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 50, top: 10),
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, left: 20, right: 20, bottom: 10),
                child: isLoading // Check if data is still loading
                    ? CircularProgressIndicator() // Display a loading indicator
                    : Column(
                        children: [
                          SizedBox(
                              width: 200,
                              height: 200,
                              child: Image.asset('Assets/images/profile.jpg')),
                          SizedBox(
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ignore: prefer_interpolation_to_compose_strings
                                Text("Name :" + listRes[0]['name']),
                                Text("Contact : " +
                                    listRes[0]['mobile'].toString()),
                                Text("Email : " +
                                    listRes[0]['email'].toString()),
                                Text("UpiId : " +
                                    listRes[0]['upiid'].toString()),
                                Text("Address : " +
                                    listRes[0]['address'].toString()),
                                Text("Id : " + listRes[0]['_id'].toString()),
                                Text("Updated On: " +
                                    listRes[0]['updatedOn'].toString()),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: SizedBox(
                                height: 35,
                                width: 100,
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text('Edit'))),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ));
  }
}
