import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/wallpapers_model.dart';
import 'package:wallpaper_app/widgets/brandName.dart';

import '../data/data.dart';
import '../widgets/wallpapers_gridview_widget.dart';
class Categorie extends StatefulWidget {
  final String catergorieSearch;
  const Categorie({super.key, required this.catergorieSearch});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpapersModel> wallpapers = [];
  @override
  void initState() {
    super.initState();
    getCategorieWallpapers(widget.catergorieSearch);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16,),
          Expanded(
            child: WallpapersGrid(wallpapers),
          ),
        ],
      ),
    );
  }
  Future<void> getCategorieWallpapers(String query) async {
    final url = Uri.parse(
        "https://api.pexels.com/v1/search?query=$query&per_page=100&page=p");
    final response = await http.get(url, headers: {"Authorization": apiKey});

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> photos = jsonData["photos"];

      setState(() {
        wallpapers = photos.map((element) {
          return WallpapersModel.fromMap(element);
        }).toList();
      });
    } else {
      // Handle error
      print('Failed to load wallpapers, status code: ${response.statusCode}');
    }
  }
}
