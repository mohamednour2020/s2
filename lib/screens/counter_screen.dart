import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int? counter = 0;

  increment() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
     counter= counter! +1;
      prefs.setInt("counter", counter!);
    });
  }

  getCounterValue() async {
    var prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt("counter");
  }

  @override
  void initState() {
    getCounterValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared preferences demo")),
      body: Column(
        children: [
          Center(child: Text("$counter")),
          Container(
            color: Colors.cyan,
            child: MaterialButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                log(
                  prefs.getInt("counter").toString(),
                  name: "Shared prefs value for counter is :",
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
