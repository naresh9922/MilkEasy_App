import 'package:flutter/material.dart';
import 'package:milkeasy/Add_products.dart';
import 'package:milkeasy/add_farmer_collector.dart';
import 'package:milkeasy/Collection_Form.dart';
import 'package:milkeasy/Set_Rate.dart';
import 'package:milkeasy/farmer_list.dart';
import 'package:milkeasy/get_feedback.dart';
import 'package:milkeasy/login.dart';
import 'package:milkeasy/profile_collector.dart';
import 'package:milkeasy/Collector_list.dart';
import 'package:milkeasy/fetch_collection_data.dart';
import 'api/feedback_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.data});
  final String title;
  final String data;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  var EmailController = TextEditingController();
  var FeedbackController = TextEditingController();
  String get collectorId => widget.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: memuItem(collectorId: collectorId),
        appBar: AppBar(
          title: const Text('MilkEasy'),
          actions: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(widget.data),
                ),
              ],
            )
          ],
        ),

        // ------------------------------body ------------------------------------------
        body: SingleChildScrollView(
          child: Wrap(
            children: [
              // --------------------------------------image ---------------------------------
              SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset("Assets/images/cow1.jpg")), // image

              //  ----------------------------about us -----------------------------------

              Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.grey.shade600,
                child: const Text(
                  "About us",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: Wrap(
                  children: [
                    Card(
                      color: Color.fromARGB(255, 238, 238, 235),
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                            "Our dairy buy milk direct from farmer in reasonable price. we decide milk price on basis of fat present in the milk provided by farmer in front of them by testing milk fat in machine. We do all transactions in transparant manner. Farmer and collector can  view their provided milk and collected milk respectively and also can view payment status also. If you want to become a member of out MilkEasy family please contact us on given contact details."),
                      ),
                    ),
                  ],
                ),
              ),

              // ------------------------------------------feedback --------------------------------
              Container(
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 5, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    const Text('Feedback',
                        style: TextStyle(fontSize: 30, color: Colors.brown)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            labelText: ' Name',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: EmailController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            labelText: 'mobile no',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: FeedbackController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            labelText: 'Feedback',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            var data = {
                              "name": nameController.text,
                              "mo_no": EmailController.text,
                              "feedback": FeedbackController.text,
                            };

                            Api.Feedback(data);
                          },
                          child: const Text('Submit')),
                    )
                  ],
                ),
              ),

              // ---------------------------contact us ----------------------------------------

              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey.shade600,
                    child: const Center(
                      child: Text(
                        "Contact us",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: const Card(
                      color: Color.fromARGB(255, 238, 238, 235),
                      elevation: 20,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              // 1 address
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_city),
                                    Text(" Address:")
                                  ],
                                ),
                                Text(
                                    "Beside Imcc college, Kothurd. Pune - 401037"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Wrap(
                              children: [
                                Icon(Icons.phone),
                                Text(' Phone : 1234567890,  0987654321'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Wrap(
                              children: [
                                Icon(Icons.email),
                                Text(' Email: milkeasy1234@gmail.com')
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.facebook),
                                Icon(Icons.facebook),
                                Icon(Icons.facebook),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // ----------------------------copyright --------------------------------------

              Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: const Center(
                    child: Text(
                      "Copyright @2030",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ));
  }
}

//---------------------------------------------------------------------------------------------------------

class memuItem extends StatelessWidget {
  final String collectorId;
  memuItem({required this.collectorId});
  final List DrawerItemList = [
    {
      "title": 'Set Rate',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 2,
    },
    {
      "title": 'Add Farmer/Collector',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 3,
    },
    {
      "title": 'add Collection',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 4,
    },
    {
      "title": 'Collector list',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 6,
    },
    {
      "title": 'view Collection',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 7,
    },
    {
      "title": 'Farmer list',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 8,
    },
    {
      "title": 'Feedback',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 9,
    },
    {
      "title": 'Add Products',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 10,
    },
    {
      "title": 'Logout',
      "traling": const Icon(Icons.chevron_right),
      'action_id': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(children: [
          const ListTile(
            leading: CircleAvatar(
                // backgroundImage: NetworkImage(""),
                ),
            title: Text('Naresh Joshi'),
            subtitle: Text('9922338844'),
          ),
          const SizedBox(
            height: 2,
          ),
          ...DrawerItemList.map((e) {
            return ListTile(
                title: Text(
                  e['title'],
                ),
                trailing: e['trailing'],
                onTap: (() {
                  if (e['action_id'] == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Set_Rate()));
                  } else if (e['action_id'] == 3) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const add_farmer_collector()));
                  } else if (e['action_id'] == 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Collection_form(collectorId: collectorId)));
                  } else if (e['action_id'] == 5) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const login()));
                  } else if (e['action_id'] == 6) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserList()));
                  } else if (e['action_id'] == 7) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MilkCollectionList()));
                  } else if (e['action_id'] == 8) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const farmer_list()));
                  } else if (e['action_id'] == 9) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const GetFeedback()));
                  } else if (e['action_id'] == 10) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AddProducts()));
                  }
                }));
          }).toList(),
        ]),
      ),
    ));
  }
}
