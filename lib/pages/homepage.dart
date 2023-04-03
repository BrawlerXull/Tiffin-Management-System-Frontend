import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var f = false;
  var x = 0;
  var index2 = 0;
  var chinmaydays = List.filled(31, false);
  var prajyotdays = List.filled(31, false);
  var varundays = List.filled(31, false);
  var hemantdays = List.filled(31, false);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("HomePage"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFffafbd), Color(0xFFffdde1)])),
        ),
      ),
      body: ListView.builder(
          itemCount: 31, // the length
          itemBuilder: (context, index) {
            index2 = index;
            index = index + 1;
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFFffafbd), Color(0xFFffdde1)])),
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      trailing: Wrap(
                        spacing: 6,
                        children: <Widget>[
                          Container(
                            child: Wrap(spacing: 4, children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5), //apply padding to all four sides
                                child: Text("Chinmay"),
                              ),
                              chinmaydays[index2].toString() == "true"
                                  ? Icon(Icons.check)
                                  : Icon(Icons.wrong_location)
                            ]),
                          ),
                          Container(
                            child: Wrap(spacing: 4, children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5), //apply padding to all four sides
                                child: Text("Prajyot"),
                              ),
                              prajyotdays[index2].toString() == "true"
                                  ? Icon(Icons.check)
                                  : Icon(Icons.wrong_location)
                            ]),
                          ),
                          Container(
                            child: Wrap(spacing: 4, children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5), //apply padding to all four sides
                                child: Text("Hemant"),
                              ),
                              hemantdays[index2].toString() == "true"
                                  ? Icon(Icons.check)
                                  : Icon(Icons.wrong_location)
                            ]),
                          ),
                          Container(
                            child: Wrap(spacing: 4, children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5), //apply padding to all four sides
                                child: Text("Varun"),
                              ),
                              varundays[index2].toString() == "true"
                                  ? Icon(Icons.check)
                                  : Icon(Icons.wrong_location)
                            ]),
                          ),
                        ],
                      ),
                      // leading: Icon(
                      //   Icons.food_bank,
                      //   size: 50.0,
                      // ),

                      title: Text('Day $index'),
                      // subtitle: Text(''),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var res = await http.get(Uri.parse(
              "https://tiffin-management-system-backend.vercel.app/all"));
          if (res.statusCode == 200) {
            var data = await json.decode(res.body);
            setState(() {
              for (int i = 0; i < 31; i++) {
                chinmaydays[i] = data["days"][i]["chinmay"];
                hemantdays[i] = data["days"][i]["hemant"];
                varundays[i] = data["days"][i]["varun"];
                prajyotdays[i] = data["days"][i]["prajyot"];
              }
            });
            print(chinmaydays);
          }
          // print(bar);
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle, // circular shape
            gradient: LinearGradient(
              colors: [Color(0xFFffafbd), Color(0xFFffdde1)],
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
