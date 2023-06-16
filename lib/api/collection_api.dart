import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseurl = "http://127.0.0.1:2000/";
//post method ---------------------------------------------

  static Collection(Map Cdata) async {
    print(Cdata);
    var url = Uri.parse("${baseurl}milk/addcollection");
    try {
      final res = await http.post(url,
          body: Cdata); // here we have to pass url and body

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
