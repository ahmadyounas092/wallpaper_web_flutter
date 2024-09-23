import 'package:flutter/material.dart';

class MyDrawerTile extends StatefulWidget {
  final String title;
  final IconData iconData;
  final void Function()? onTap;

  const MyDrawerTile(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  State<MyDrawerTile> createState() => _MyDrawerTileState();
}

class _MyDrawerTileState extends State<MyDrawerTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: Text(widget.title),
      leading: Icon(widget.iconData),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black,),
    );
  }
}
