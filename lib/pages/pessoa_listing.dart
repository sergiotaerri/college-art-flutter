import 'package:flutter/material.dart';
import '../dbprovider.dart';

class ListViewHome extends StatelessWidget {
  final titles = ["João", "Marcinho", "Cecília"];
  final subtitles = [
    "064.322.113-00",
    "054.142.123-70",
    "089.343.333-40",
  ];
  final icons = [Icons.close, Icons.close, Icons.close];
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {

          return Card(
              child: ListTile(
                  title: Text(titles[index]),
                  subtitle: Text(subtitles[index]),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/c3/c3077298acacb4ce6412f062def36baed6c644a0_full.jpg")),
                  trailing: Icon(icons[index])));
        });

  }
}