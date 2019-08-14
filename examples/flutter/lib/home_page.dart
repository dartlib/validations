import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //this async func will get data from the internet
  //when our func is done we return a string
  Future<void> getData() async {
    //we have to wait to get the data so we use 'await'
    try {
      final response = await http.get(
          //Uri.encodeFull removes all the dashes or extra characters present in our Uri
          Uri.encodeFull('http://127.0.0.2/'),
          headers: {
            //if your api require key then pass your key here as well e.g 'key': 'my-long-key'
            'Accept': 'application/json'
          }).timeout(Duration(seconds: 2));

      print(response.body); // it will print => title: 'qui est esse'
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Stateful Widget!'),
            backgroundColor: Colors.deepOrange),
        body: Center(
            child: RaisedButton(
                child: const Text('Get data!',
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0)),
                onPressed: getData)));
  }
}
