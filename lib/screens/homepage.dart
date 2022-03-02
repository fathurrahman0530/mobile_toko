// ignore_for_file: prefer_const_constructors, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  final String url = 'http://localhost:8000/api/products';

  Future getProducts() async {
    var response = await http.get(Uri.parse(url));
    // print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Toko Online",
        ),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var snapDataString = (snapshot.data! as Map<String, dynamic>);
            return ListView.builder(
              itemCount: snapDataString['data'].length,
              itemBuilder: (context, index) {
                return Container(
                  height: 180,
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.network(
                            snapDataString['data'][index]['img_url']
                          ),
                        ),
                        Text(snapDataString['data'][index]['name']),
                        Text(snapDataString['data'][index]['description']),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("data");
          }
        },
      ),
    );
  }
}
