import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/components/categories_tile.dart';
import 'package:wallpaper_app/components/my_drawer.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpapers_model.dart';
import 'package:wallpaper_app/view/search.dart';
import 'package:wallpaper_app/widgets/brandName.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/widgets/wallpapers_gridview_widget.dart';

const String apiKey =
    'xm4AaeXsZmCR9Ngm1KVW4W69x9eBSoaW7y2h6Kbrj3sjeF7pnx9sziy7';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = [];
  List<WallpapersModel> wallpapers = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getTrendingWallpapers(); // Fetch wallpapers when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // This will adjust the body height when the keyboard opens
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        title: brandName(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                  searchQuery: searchController.text,
                                )));
                      },
                      child: Container(child: Icon(Icons.search, color: Theme.of(context).colorScheme.tertiary,))),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: categories.length,
                padding: EdgeInsets.only(right: 24, left: 24),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    imgUrl: categories[index].imgUrl,
                    title: categories[index].categoriesName,
                  );
                },
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: WallpapersGrid(wallpapers),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  Future<void> getTrendingWallpapers() async {
    final url = Uri.parse(
        "https://api.pexels.com/v1/search?query=nature&per_page=100&page=1");
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
