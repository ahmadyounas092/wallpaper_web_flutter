import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/components/my_drawer.dart';
import 'package:wallpaper_app/widgets/brandName.dart';
import 'package:http/http.dart' as http;
import '../data/data.dart';
import '../model/wallpapers_model.dart';
import '../widgets/wallpapers_gridview_widget.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  const Search({super.key, required this.searchQuery});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<WallpapersModel> wallpapers = [];
  bool isLoading = false; // To show a loading indicator

  @override
  void initState() {
    super.initState();
    searchController.text = widget.searchQuery;
    if (widget.searchQuery.isNotEmpty) {
      getSearchedWallpapers(widget.searchQuery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: brandName(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
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
                    if (searchController.text.isNotEmpty) {
                      getSearchedWallpapers(searchController.text);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search, color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16,),
          isLoading
              ? Center(child: CircularProgressIndicator(
            backgroundColor: Colors.yellowAccent.shade100,
            color: Colors.tealAccent,
          )) // Show loading indicator
              : Expanded(
            child: WallpapersGrid(wallpapers),
          ),
        ],
      ),
    );
  }

  Future<void> getSearchedWallpapers(String query) async {
    if (query.isEmpty) return; // Skip if the query is empty

    setState(() {
      isLoading = true; // Start loading
    });

    final url = Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=1000000 "); // Increase per_page for testing
    final response = await http.get(url, headers: {"Authorization": apiKey});

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> photos = jsonData["photos"];

      setState(() {
        wallpapers = photos.map((element) {
          return WallpapersModel.fromMap(element);
        }).toList();
        isLoading = false; // Stop loading
      });
    } else {
      // Handle error
      setState(() {
        isLoading = false; // Stop loading
      });
      print('Failed to load wallpapers, status code: ${response.statusCode}');
    }
  }
}
