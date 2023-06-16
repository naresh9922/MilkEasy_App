// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class collection extends StatefulWidget {
  const collection({super.key});
  @override
  State<collection> createState() => _collectionState();
}

class _collectionState extends State<collection> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Collection'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Morning"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val;
                          });
                        },
                      ),
                    ),
                    const Text("Evening"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                  labelText: 'Farmer Name',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  labelText: 'Fat',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  labelText: 'Milk Quantity',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    child: ElevatedButton(onPressed: () {}, child: Text('Add')),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
