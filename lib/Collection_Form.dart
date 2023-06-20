import 'package:flutter/material.dart';
import 'package:milkeasy/api/collection_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:milkeasy/dataclass/UserName.dart';

class Collection_form extends StatefulWidget {
  const Collection_form({super.key, required this.collectorId});
  final String collectorId;
  @override
  State<Collection_form> createState() => _Collection_formState();
}

class _Collection_formState extends State<Collection_form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var fatController = TextEditingController();
  var qtyController = TextEditingController();
  String? _dropDownValue;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      var data = {
        "collectorId": collectorId,
        "shift": _dropDownValue,
        "Farmer_name": selectedUsername!.name,
        "fat": fatController.text,
        "qty": qtyController.text,
      };

      Api.Collection(data);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Milk Collected successfully'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
// for drop down button list

  List<Username> usernames = [];
  Username? selectedUsername;
  late String collectorId;

  @override
  void initState() {
    super.initState();
    fetchUsernames();
    collectorId = widget.collectorId;
  }

  Future<void> fetchUsernames() async {
    final response =
        await http.post(Uri.parse('http://127.0.0.1:2000/user/fetchFarmers'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final data = body['data'] as List<dynamic>;
      // print(data);
      setState(() {
        usernames = data.map((json) => Username.fromJson(json)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Milk Collection form"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField<Username>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                value: selectedUsername,
                onChanged: (Username? newValue) {
                  setState(() {
                    selectedUsername = newValue;
                  });
                },
                hint: Text("Farmer name"),
                items: usernames.map<DropdownMenuItem<Username>>(
                  (Username item) {
                    return DropdownMenuItem<Username>(
                      value: item,
                      child: Text(item.name),
                    );
                  },
                ).toList(),
                validator: (value) {
                  if (value == null || usernames.isEmpty) {
                    return 'Please select farmer name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                hint: _dropDownValue == null
                    ? const Text('Shift')
                    : Text(
                        _dropDownValue!,
                      ),
                isExpanded: true,
                iconSize: 30.0,
                items: ['Morning', 'Evening'].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val;
                    },
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select shift';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: fatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Fat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp('[0-9]').hasMatch(value)) {
                    return 'Please enter fat';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: qtyController,
                decoration: const InputDecoration(
                  labelText: "enter milk quantity",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'(^(?:[+0]9)?[0-9])').hasMatch(value)) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("submit"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
