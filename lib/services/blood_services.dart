import 'package:blodd/model/boold_model.dart';
import 'package:http/http.dart' as http;

class MyBloodServices {
  Future<BloodModel?> fetchData() async {
    String api =
        "https://dev-badhan-api.stylezworld.net/api/common/blood/groups";

    print(" URL..>>>>>$api");
    var response = await http.get(
      Uri.parse(api),
    );
    print("Response_____   ${response.body}");

    if (response.statusCode == 200) {
      var data = response.body;
      print("Response ___${response.body}");

      return bloodModelFromJson(data);
    } else {
      return null;
    }
  }
}
