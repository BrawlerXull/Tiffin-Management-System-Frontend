import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  bool chinmay = false;
  bool varun = false;
  bool prajyot = false;
  bool hemant = false;
  var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("UpdatePage"),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFffafbd), Color(0xFFffdde1)])),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFFffafbd), Color(0xFFffdde1)],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: myController,
                decoration: InputDecoration(
                    labelText: 'Enter the date',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none),
              ),
              Row(
                children: [
                  Text("chinmay"),
                  Switch(
                    value: chinmay,
                    onChanged: (bool value) {
                      setState(() {
                        chinmay = value;
                      });
                      print(chinmay);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("varun"),
                  Switch(
                    value: varun,
                    onChanged: (bool value) {
                      setState(() {
                        varun = value;
                      });
                      print(varun);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("hemant"),
                  Switch(
                    value: hemant,
                    onChanged: (bool value) {
                      setState(() {
                        hemant = value;
                      });
                      print(hemant);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("prajyot"),
                  Switch(
                    value: prajyot,
                    onChanged: (bool value) {
                      setState(() {
                        prajyot = value;
                      });
                      print(prajyot);
                    },
                  ),
                ],
              ),
              FloatingActionButton(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFFffafbd), Color(0xFFffdde1)],
                        )),
                    child: Center(child: Text("R")),
                  ),
                  onPressed: () async {
                    var res = await http.get(Uri.parse(
                        "https://tiffin-management-system-backend.vercel.app/all"));
                    if (res.statusCode == 200) {
                      var data = await json.decode(res.body);
                      var changed = myController.text;
                      var s =
                          "https://tiffin-management-system-backend.vercel.app/";
                      s = s + "update/";
                      s = s + "$changed";
                      s = s + "/$chinmay/$prajyot/$varun/$hemant";

                      print(s);
                      await http.get(Uri.parse(s));
                      // await http.get(Uri.parse(
                      //     "https://tiffin-management-system-backend.vercel.app/"));
                    }
                  }),
            ],
          ),
        ));
  }
}
