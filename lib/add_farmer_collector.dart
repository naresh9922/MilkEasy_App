import 'package:flutter/material.dart';
import 'package:milkeasy/api/add_fca_api.dart';

class add_farmer_collector extends StatefulWidget {
  const add_farmer_collector({super.key});

  @override
  State<add_farmer_collector> createState() => _Add_farmer_collectorState();
}

class _Add_farmer_collectorState extends State<add_farmer_collector> {
  var userController = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var upiController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();

  List<String> location = ['Admin', 'Collector', 'Farmer'];
  // String _selectedLocation = "";
  String _value = "";
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
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "Mobile No.",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: upiController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "UPI Id",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: confirmPassController,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          // Api.AddFCA();
                          var data = {
                            "usertype": _value,
                            "name": nameController.text,
                            "location": userController.text,
                            "mobile": mobileController.text,
                            "email": emailController.text,
                            "upiid": upiController.text,
                            "address": addressController.text,
                            "password": passwordController.text,
                            "confirmpass": confirmPassController.text,
                          };

                          Api.AddFCA(data);
                        },
                        child: const Text("submit"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
