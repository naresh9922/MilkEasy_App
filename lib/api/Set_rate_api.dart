import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseurl = "http://192.168.1.7:2000/";
//post method ---------------------------------------------

  static SetRate(Map Srate) async {
    print(Srate);
    var url = Uri.parse("${baseurl}setRate/set");
    try {
      final res = await http.post(url,
          body: Srate); // here we have to pass url and body

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

// get method  ---------------------------------------

  // static getProduct() async {
  //   List<product> products = [];

  //   var url = Uri.parse("${baseurl}get_product");
  //   try {
  //     final res = await http.get(url);
  //     if (res.statusCode == 200) {
  //       var data = jsonDecode(res.body.toString());

  //       data['products'].forEach(
  //         (value) => {
  //           products.add(
  //             product(
  //                 name: value['pname'],
  //                 desc: value['pdesc'],
  //                 price: value['pprice'],
  //                 id: value['id'].toString()),
  //           ),
  //         },
  //       );
  //       return products;
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

// update method --------------------------------------------

  // static updateProduct(id, body) async {
  //   var url = Uri.parse("${baseurl}update/$id");
  //   final res = await http.post(url, body: body);

  //   if (res.statusCode == 200) {
  //     print(jsonDecode(res.body));
  //   } else {
  //     print("failed to updata");
  //   }
  // }

  // // delete method------------------------------------------

  // static deleteProduct(id) async {
  //   var url = Uri.parse("${baseurl}delete/$id");

  //   try {
  //     final res = await http.delete(url);

  //     if (res.statusCode == 204) {
  //       print(jsonDecode(res.body));
  //     } else {
  //       print("failed to delete");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
