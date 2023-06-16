import 'package:flutter/material.dart';
import 'package:milkeasy/add_farmer_collector.dart';
import 'package:milkeasy/Collection_Form.dart';
import 'package:milkeasy/Set_Rate.dart';
import 'package:milkeasy/farmer_list.dart';
import 'package:milkeasy/get_feedback.dart';
import 'package:milkeasy/login.dart';
import 'package:milkeasy/profile.dart';
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
      // home: const MyHomePage(
      //   title: "",
      // ),
      home: const login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameController = TextEditingController();
  var EmailController = TextEditingController();
  var FeedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: memuItem(),
        appBar: AppBar(
          title: const Text('MilkEasy'),
          actions: const [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text('Hi Naresh'),
                ),
                // memuItem(),
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
                      padding: EdgeInsets.all(10.0),
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
                      padding: EdgeInsets.all(10.0),
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
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: FeedbackController,
                        decoration: InputDecoration(
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
                    child: Center(
                      child: const Text(
                        "Contact us",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Card(
                      color: Color.fromARGB(255, 238, 238, 235),
                      elevation: 20,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              // 1 address
                              children: [
                                Row(
                                  children: const [
                                    Icon(Icons.location_city),
                                    Text(" Address:")
                                  ],
                                ),
                                const Text(
                                    "Beside Imcc college, Kothurd. Pune - 401037"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Wrap(
                              children: const [
                                Icon(Icons.phone),
                                Text(' Phone : 1234567890,  0987654321'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Wrap(
                              children: const [
                                Icon(Icons.email),
                                Text(' Email: milkeasy1234@gmail.com')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
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
  final List DrawerItemList = [
    {
      "title": 'Profile',
      "traling": Icon(Icons.chevron_right),
      'action_id': 1,
    },
    {
      "title": 'Set Rate',
      "traling": Icon(Icons.chevron_right),
      'action_id': 2,
    },
    {
      "title": 'Add Farmer/Collector',
      "traling": Icon(Icons.chevron_right),
      'action_id': 3,
    },
    {
      "title": 'add Collection',
      "traling": Icon(Icons.chevron_right),
      'action_id': 4,
    },
    {
      "title": 'Logout',
      "traling": Icon(Icons.chevron_right),
      'action_id': 5,
    },
    {
      "title": 'Collector list',
      "traling": Icon(Icons.chevron_right),
      'action_id': 6,
    },
    {
      "title": 'view Collection',
      "traling": Icon(Icons.chevron_right),
      'action_id': 7,
    },
    {
      "title": 'Farmer list',
      "traling": Icon(Icons.chevron_right),
      'action_id': 8,
    },
    {
      "title": 'Feedback',
      "traling": Icon(Icons.chevron_right),
      'action_id': 9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(children: [
          ListTile(
            leading: CircleAvatar(
                // backgroundImage: NetworkImage(""),
                ),
            title: Text('Naresh Joshi'),
            subtitle: Text('9922338844'),
          ),
          SizedBox(
            height: 2,
          ),
          ...DrawerItemList.map((e) {
            return ListTile(
                title: Text(
                  e['title'],
                ),
                trailing: e['trailing'],
                onTap: (() {
                  if (e['action_id'] == 1) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => profile()));
                  } else if (e['action_id'] == 2) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Set_Rate()));
                  } else if (e['action_id'] == 3) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => add_farmer_collector()));
                  } else if (e['action_id'] == 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Collection_form()));
                  } else if (e['action_id'] == 5) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => login()));
                  } else if (e['action_id'] == 6) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UserList()));
                  } else if (e['action_id'] == 7) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MilkCollectionList()));
                  } else if (e['action_id'] == 8) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => farmer_list()));
                  } else if (e['action_id'] == 9) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GetFeedback()));
                  }
                }));
          }).toList(),
        ]),
      ),
    ));
  }
}
