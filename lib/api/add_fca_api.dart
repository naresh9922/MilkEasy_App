import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'package:milkeasy/models/add_fca_model.dart';

class Api {
  static const baseurl = "http://127.0.0.1:2000/";
//post method ---------------------------------------------

  static AddFCA(Map Fdata) async {
    print(Fdata);
    var url = Uri.parse("${baseurl}user/create");
    try {
      final res = await http.post(url,
          body: Fdata); // here we have to pass url and body

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data.toString());
      } else {
        print("failed to get response");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
