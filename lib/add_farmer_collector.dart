import 'package:flutter/material.dart';
import 'package:milkeasy/api/add_fca_api.dart';

class add_farmer_collector extends StatefulWidget {
  const add_farmer_collector({super.key});

  @override
  State<add_farmer_collector> createState() => _Add_farmer_collectorState();
}

class _Add_farmer_collectorState extends State<add_farmer_collector> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var userController = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var upiController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();

  List<String> location = ['Admin', 'Collector', 'Farmer'];
  String _value = "null";

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic here
      if (_value == "null") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text(
                'Select userType',
                style: TextStyle(color: Colors.orange),
              ),
              actions: [
                TextButton(
                  child: Text('OK', style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        var data = {
          "usertype": _value,
          "name": nameController.text,
          "location": userController.text,
          "mobile": mobileController.text,
          "email": emailController.text,
          "upiid": upiController.text,
          "address": addressController.text,
          "password": passwordController.text,
        };

        Api.AddFCA(data);
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

                    _formKey.currentState?.reset();
                  },
                ),
              ],
            );
          },
        );
      }
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Admin"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Radio(
                        value: "Admin",
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val!;
                          });
                        },
                      ),
                    ),
                    const Text("Collector"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Radio(
                        value: "Collector",
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val!;
                          });
                        },
                      ),
                    ),
                    const Text('Farmer'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Radio(
                        value: "Farmer",
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp("([A-Z]|[a-z]){2,50}").hasMatch(value)) {
                        return 'Please enter valid name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Mobile No.",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                              .hasMatch(value)) {
                        return 'Please enter valid mobile no.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: upiController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "UPI Id",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !RegExp('[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}')
                              .hasMatch(value)) {
                        return 'Please enter valid upi Id';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Address",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return 'Please enter password of minimum length 5';
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
