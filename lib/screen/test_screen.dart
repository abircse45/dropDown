import 'package:blodd/controller/blood_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void initState() {
    var dropdata = Provider.of<BloodController>(context, listen: false);
    dropdata.getDataCalling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<BloodController>(builder: (_, data, child) {
        return data.loader
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    elevation: 10,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Select Blood Group",
                            ),
                          ),
                          isExpanded: true,
                          value: data.valueDrop,
                          items: data.orderList.data!.map((e) {
                            return DropdownMenuItem(
                                value: e.id.toString(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${e.name}"),
                                ));
                          }).toList(),
                          onChanged: (val) {
                            data.setCHange(val!);
                          }),
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
