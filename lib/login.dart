// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:milkeasy/Farmer_homepage.dart';
import 'package:milkeasy/CollectorHomepage.dart';
import 'package:milkeasy/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String mail = "";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    // var url = Uri.parse("http://192.168.1.7:2000/login/login");
    var url = Uri.parse("http://192.168.174.222:2000/login/login"); // mymobile
    var data = {
      'email': _usernameController.text,
      'password': _passwordController.text,
      'usertype': usertype
    };
    mail = _usernameController.text;
    final http.Response response = await http.post(url, body: (data));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final name = responseData['name'] as String;
      if (usertype == "Admin") {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: "",
            data: mail,
            name: name,
          ),
        ));
        print(name);
      } else if (usertype == "Collector") {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CollectorHomePage(
            mail: mail,
            info: "Admin",
            data: mail,
            nam: name,
          ),
        ));
      } else if (usertype == "Farmer") {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FarmerHomePage(
            data: mail,
            name: name,
          ),
        ));
      }
    } else {
      // Failed login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Error'),
            content: Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Future<void> _login() async {
  //   // var url = Uri.parse("http://192.168.137.97:2000/login/login");
  //   var url = Uri.parse("http://192.168.1.7:2000/login/login");
  //   var data = {
  //     'email': _usernameController.text,
  //     'password': _passwordController.text,
  //     'usertype': usertype
  //   };
  //   mail = _usernameController.text;
  //   final http.Response response = await http.post(url, body: (data));
  //   if (response.statusCode == 200 && usertype == "Admin") {
  //     // print(mail);

  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => MyHomePage(
  //               title: "",
  //               data: mail,
  //             )));
  //   } else if (response.statusCode == 200 && usertype == "Collector") {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) =>
  //             CollectorHomePage(mail: mail, info: "Admin", data: mail)));
  //   } else if (response.statusCode == 200 && usertype == "Farmer") {
  //     Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => FarmerHomePage(data: mail)));
  //   } else {
  //     // Failed login
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Login Error'),
  //           content: Text('Invalid username or password.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  int? _value = 0;
  String usertype = "";
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'MilkEasy',
            style: TextStyle(color: Colors.brown, fontSize: 30),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
            child: Column(
              children: [
                Container(
                    child: const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.brown, fontSize: 20),
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text("Admin"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (val) {
                              setState(() {
                                _value = val;
                                usertype = "Admin";
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Collector"),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: (val) {
                              setState(() {
                                _value = val;
                                usertype = "Collector";
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Farmer'),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Radio(
                            value: 3,
                            groupValue: _value,
                            onChanged: (val) {
                              setState(() {
                                _value = val;
                                usertype = "Farmer";
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0, top: 20),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ))),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: ((value) {
                      setState(() {
                        email = value;
                      });
                    }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 20),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          onPressed: _login, child: const Text('Login'))),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     TextButton(
                //       child: Text(
                //         "Forgot password",
                //       ),
                //       onPressed: () {},
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
