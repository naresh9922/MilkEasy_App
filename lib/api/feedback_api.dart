import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseurl = "http:192.168.174.222:2000/";
  // static const baseurl = "http://192.168.1.7:2000/";
//post method ---------------------------------------------

  static Feedback(Map Fdata) async {
    print(Fdata);
    var url = Uri.parse("${baseurl}feedback/feed");
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
