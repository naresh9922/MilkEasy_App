import 'package:flutter/material.dart';
import 'package:milkeasy/api/collection_api.dart';

class Collection_form extends StatefulWidget {
  const Collection_form({super.key});

  @override
  State<Collection_form> createState() => _Collection_formState();
}

class _Collection_formState extends State<Collection_form> {
  var nameController = TextEditingController();
  var fatController = TextEditingController();
  var qtyController = TextEditingController();
  String? _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Milk Collection form"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'farmer name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: fatController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Fat',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: qtyController,
                decoration: InputDecoration(
                    labelText: "enter milk quantity",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      var data = {
                        "shift": _dropDownValue,
                        "name": nameController.text,
                        "fat": fatController.text,
                        "qty": qtyController.text,
                      };

                      Api.Collection(data);
                    },
                    child: Text("submit")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
