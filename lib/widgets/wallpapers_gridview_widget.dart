import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpapers_model.dart';
import 'package:wallpaper_app/view/image_view.dart';

Widget WallpapersGrid(List<WallpapersModel> wallpapers) {
  return GridView.builder(
    padding: EdgeInsets.symmetric(horizontal: 16),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
    ),
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemCount: wallpapers.length,
    itemBuilder: (context, index) {
      final wallpaper = wallpapers[index];
      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageView(imgUrl: wallpaper.src.portrait)));
        },
        child: Hero(
          tag: wallpaper.src.portrait,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.0), // Adjust the radius as needed
            child: GridTile(
              child: Image.network(
                wallpaper.src.portrait, // Use `Image.network` to display the image from a URL
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    },
  );
}
