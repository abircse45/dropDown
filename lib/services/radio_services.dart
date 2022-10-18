import 'package:blodd/model/boold_model.dart';
import 'package:blodd/model/radio_model.dart';
import 'package:http/http.dart' as http;

class MyRadioServices {
  Future<RadioModel?> fetchData() async {
    String api =
        "https://dev-badhan-api.stylezworld.net/api/common/genders";

    print(" URL..>>>>>$api");
    var response = await http.get(
      Uri.parse(api),
    );
    print("Response_____   ${response.body}");

    if (response.statusCode == 200) {
      var data = response.body;
      print("Response ___${response.body}");

      return radioModelFromJson(data);
    } else {
      return null;
    }
  }
}
