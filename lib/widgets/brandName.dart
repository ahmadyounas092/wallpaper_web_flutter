import 'package:flutter/material.dart';

Widget brandName(){
  return Center(
    child: RichText(
        text: TextSpan(
          text: "Wallpaper",
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w500, fontSize: 25),
          children: <TextSpan>[
            TextSpan(text: "Web", style: TextStyle(color: Colors.cyan))
          ]
        ),
    ),
  );
}