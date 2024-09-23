import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:wallpaper_app/view/categorie.dart';
import 'package:wallpaper_app/view/image_view.dart'; // Import this for ImageFilter

class CategoriesTile extends StatelessWidget {
  final String imgUrl;
  final String title;

  const CategoriesTile({super.key, required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Categorie(catergorieSearch: title)));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 4, right: 4),
        width: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Adjust blur intensity
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.0), // Overlay color (adjust opacity)
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
