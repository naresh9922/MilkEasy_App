import 'package:flutter/material.dart';
import 'package:milkeasy/api/Set_rate_api.dart';

class Set_Rate extends StatefulWidget {
  const Set_Rate({Key? key}) : super(key: key);

  @override
  State<Set_Rate> createState() => _Set_RateState();
}

class _Set_RateState extends State<Set_Rate> {
  var rateController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Add this line

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      var data = {
        "rate": rateController.text,
      };

      Api.SetRate(data);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Milk fat rate set successfully'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  rateController.text = ""; // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Rate'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 100, bottom: 250),
          child: Card(
            color: const Color.fromARGB(255, 235, 235, 227),
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 40),
                    child: Text('Set Rate for 1 Fat only!'),
                  ),
                  TextFormField(
                    // Updated TextField to TextFormField
                    controller: rateController,
                    decoration: InputDecoration(
                      labelText: 'Fat Rate',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      // Updated validator function
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Please enter a valid fat rate';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      height: 30,
                      width: 80,
                      child: ElevatedButton(
                        onPressed: _submitForm, // Updated onPressed function
                        child: const Text('Set'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
