import 'package:flutter/material.dart';
import 'package:milkeasy/api/addProduct_api.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var categortController = TextEditingController();
  var priceController = TextEditingController();
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var imageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic here
      var data = {
        "category": categortController.text,
        "title": titleController.text,
        "price": priceController.text,
        "description": descController.text,
        "image": imageController.text,
      };

      Api.AddProduct(data);
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
                  categortController.text = "";
                  titleController.text = "";
                  priceController.text = "";
                  descController.text = "";
                  imageController.text = "";
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
        title: const Text("Add Farmer/ Collector"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(border: Border.all(color: Colors.brown)),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "title",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp("([A-Z]|[a-z]){2,50}").hasMatch(value)) {
                        return 'Please enter valid title';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: categortController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "category",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp("([A-Z]|[a-z]){2,50}").hasMatch(value)) {
                        return 'Please enter valid category';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: descController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Description",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp("([A-Z]|[a-z]){2,50}").hasMatch(value)) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Price",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp("(^(?:[+0]9)?[0-9])").hasMatch(value)) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: imageController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "image",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp("^[a-z][a-z '-.,]{0,31}").hasMatch(value)) {
                        return 'Please enter valid image';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      width: 100,
                      height: 40,
                      child: ElevatedButton(
                          child: const Text("submit"), onPressed: _submitForm)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
