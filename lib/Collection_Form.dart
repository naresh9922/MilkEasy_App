import 'package:flutter/material.dart';
import 'package:milkeasy/api/collection_api.dart';

class Collection_form extends StatefulWidget {
  const Collection_form({super.key});

  @override
  State<Collection_form> createState() => _Collection_formState();
}

class _Collection_formState extends State<Collection_form> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var fatController = TextEditingController();
  var qtyController = TextEditingController();
  String? _dropDownValue;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic here
      var data = {
        "shift": _dropDownValue,
        "name": nameController.text,
        "fat": fatController.text,
        "qty": qtyController.text,
      };

      Api.Collection(data);
      // Assuming the form submission is successful, show the pop-up message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User added successfully'),
            actions: [
              TextButton(
                child: Text('OK'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Milk Collection form"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'farmer name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp("^[a-z][a-z '-.,]{0,31}").hasMatch(value)) {
                    return 'Please enter valid name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                hint: _dropDownValue == null
                    ? Text('Shift')
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
                decoration: InputDecoration(
                    labelText: 'Fat',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(r'(^(?:[+0]9)?[0-9])').hasMatch(value)) {
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
                decoration: InputDecoration(
                    labelText: "enter milk quantity",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
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
                      child: const Text("submit"), onPressed: _submitForm)),
            ),
          ],
        ),
      ),
    );
  }
}
