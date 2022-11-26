import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:termo_vana/models/order_model.dart';

class CustomerOrderController extends GetxController {
  dynamic customerOrderList = [].obs;

  Future<OrderModel> getData({String xxxxxx}) async {
    var url = "";
    var map = Map<String, dynamic>();
    map['xxxxxxxx'] = xxxxxxx;
    Map<String, String> body = {};
    Map<String, String> headers = {
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response;
    try {
      response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: map,
        encoding: encoding,
      );
    } catch (e) {
      print(e.toString());
    }
    return _dataParse(response);
  }

  Future<OrderModel> _dataParse(http.Response response) async {
    if (response.statusCode == 200) {
      var parse = json.decode(response.body);
      print(json.decode(response.body));
      print('1');

      List<dynamic> parsedListJson = jsonDecode(response.body);
      customerOrderList = List<OrderModel>.from(
          parsedListJson.map((i) => OrderModel.fromMap(i)));

    } else if (response.statusCode == 429) {
      print("Birden fazla işlemi kısa sürede yaptınız lütfen bekleyiniz");
    } else {
      print(response.statusCode);
    }
  }
}
