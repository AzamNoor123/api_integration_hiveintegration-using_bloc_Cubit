import 'package:flutter/material.dart';

class custom_listView_builder extends StatelessWidget {
  final int itemcount;
  final String leading;
  final String title;

  const custom_listView_builder({
    required this.itemcount,
    required this.leading,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemcount,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text(leading),
          title: Text(title),
          tileColor: Colors.blueAccent,
        );
      },
    );
  }
}
