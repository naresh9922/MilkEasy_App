import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseurl = "http://127.0.0.1:2000/";
//post method ---------------------------------------------

  static SetRate(Map rate) async {
    print(rate);
    var url = Uri.parse("${baseurl}setRate/set");
    try {
      final res =
          await http.post(url, body: rate); // here we have to pass url and body

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
