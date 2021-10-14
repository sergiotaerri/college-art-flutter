import 'package:flutter/material.dart';
import 'package:artes/pages/pessoa_listing.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 600,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
            onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => ListViewHome()));
            },
            child: Text(
              'Listagem dos brabos',
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
          ),
        ),
        ),
      );

  }
}
