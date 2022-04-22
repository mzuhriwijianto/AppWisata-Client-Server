import 'package:flutter/material.dart';
import 'package:flutterlayout/done_tourism_list.dart';
import 'package:flutterlayout/tourism_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Bojonegoro"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DoneTourismList();
                }));
              },
              icon: const Icon(Icons.done_outline))
        ],
      ),
      body: const TourismList(),
    );
  }
}
