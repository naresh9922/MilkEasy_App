import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 50, top: 10),
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset('Assets/images/profile.jpg')),
                    SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact : 1234567890"),
                          Text("Email : asdfghjkl;'"),
                          Text("UpiId : asdfghjkl;'"),
                          Text("Address : qwertyuiop[]asdfghjkl;'"),
                          Text("Id : 23"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: SizedBox(
                          height: 35,
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Edit'))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
