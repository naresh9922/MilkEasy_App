import 'package:flutter/material.dart';
import 'package:milkeasy/api/Set_rate_api.dart';

class Set_Rate extends StatefulWidget {
  const Set_Rate({super.key});

  @override
  State<Set_Rate> createState() => _Set_RateState();
}

class _Set_RateState extends State<Set_Rate> {
  var rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Rate'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 250),
        child: Card(
          color: Color.fromARGB(255, 235, 235, 227),
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 40),
                  child: Text('Set Rate for 1 Fat only !'),
                ),
                TextField(
                  controller: rateController,
                  decoration: InputDecoration(
                      labelText: 'Fat Rate',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                      height: 30,
                      width: 80,
                      child: ElevatedButton(
                          onPressed: () {
                            var data = {
                              "rate": rateController.text,
                            };

                            Api.SetRate(data);
                          },
                          child: Text('Set'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
