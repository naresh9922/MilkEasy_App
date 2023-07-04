import 'package:flutter/material.dart';
import 'package:milkeasy/Collection_Form.dart';
import 'package:milkeasy/api/feedback_api.dart';
import 'package:milkeasy/login.dart';
import 'package:milkeasy/profile_collector.dart';
import 'package:milkeasy/fetch_collection_data.dart';

class CollectorHomePage extends StatefulWidget {
  final String data;
  const CollectorHomePage(
      {super.key,
      required String info,
      required String mail,
      required this.data});

  @override
  State<CollectorHomePage> createState() => _CollectorHomePageState();
}

class _CollectorHomePageState extends State<CollectorHomePage> {
  final String title = "";
  var nameController = TextEditingController();
  var EmailController = TextEditingController();
  var FeedbackController = TextEditingController();
  late String collectorId;

  @override
  void initState() {
    super.initState();
    collectorId = widget.data;
  }

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
  final String collectorId;
  memuItem({required this.collectorId});
  final List DrawerItemList = [
    {
      "title": 'Profile',
      "traling": Icon(Icons.chevron_right),
      'action_id': 1,
    },
    {
      "title": 'add Collection',
      "traling": Icon(Icons.chevron_right),
      'action_id': 4,
    },
    {
      "title": 'view Collection',
      "traling": Icon(Icons.chevron_right),
      'action_id': 7,
    },
    {
      "title": 'Logout',
      "traling": Icon(Icons.chevron_right),
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
          ListTile(
            leading: CircleAvatar(
                // backgroundImage: NetworkImage(""),
                ),
            title: Text(collectorId),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => profile(data: collectorId)));
                  } else if (e['action_id'] == 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Collection_form(collectorId: collectorId)));
                  } else if (e['action_id'] == 5) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => login()));
                  } else if (e['action_id'] == 7) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MilkCollectionList()));
                  }
                }));
          }).toList(),
        ]),
      ),
    ));
  }
}
